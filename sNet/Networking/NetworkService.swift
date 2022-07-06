//
//  NetworkService.swift
//  sNet
//
//  Created by Юрий Гриневич on 14.06.2022.
//

import Foundation
import Alamofire
import RealmSwift

enum MethodsAPIVK {
    case friendList
    case photosList
    case groupsList
    case groupSearch
    
    var method: String {
        switch self {
        case .friendList:
            return "friends.get"
        case .photosList:
            return "photos.getAll"
        case .groupsList:
            return "groups.get"
        case .groupSearch:
            return "groups.search"
        }
    }
    
    var description: String {
        switch self {
        case .friendList:
            return "Friend List:"
        case .photosList:
            return "Photo List:"
        case .groupsList:
            return "Group List:"
        case .groupSearch:
            return "Searched Groups:"
        }
    }
}

class NetworkService {
    
    static let vkAPIVersion = "5.131"
    
    private let session = Session.instance
    
    private let apiURL = "https://api.vk.com/method/"
    private let method: MethodsAPIVK = .friendList
    
    ///Getting info for specifid userID
    func getFiendsInfo(for userID: Int, info: MethodsAPIVK) {
        
        let url = apiURL + info.method
        let parameters: Parameters = [
            "user_id": userID,
            "owner_id": userID,
            "fields": "photo_100",
            "access_token": session.token,
            "v": NetworkService.vkAPIVersion
        ]
        
        AF.request(url, method: .get, parameters: parameters).responseData { [weak self] response in
            switch response.result {
            case .success(let data):
                do {
                    let friends = try JSONDecoder().decode(FriendsResponse.self, from: data).items
                    self?.saveFriendsData(friends)
                    //  completion()
                } catch {
                    print("Error while decoding response from \(#function)")
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    /*
     func getFiendsInfo(for userID: Int, info: MethodsAPIVK, completion: @escaping ([Friends]) -> Void) {
     
     let url = apiURL + info.method
     let parameters: Parameters = [
     "user_id": userID,
     "owner_id": userID,
     "fields": "photo_100",
     "access_token": session.token,
     "v": NetworkService.vkAPIVersion
     ]
     
     AF.request(url, method: .get, parameters: parameters).responseData { [weak self] response in
     switch response.result {
     case .success(let data):
     do {
     
     //                    let asJSON = try JSONSerialization.jsonObject(with: data)
     //                    print("\(info.description)\(asJSON)")
     let friends = try JSONDecoder().decode(FriendsResponse.self, from: data).items
     self?.saveFriendsData(friends)
     completion(friends)
     } catch {
     print("Error while decoding response from \(#function)")
     }
     case .failure(let error):
     print(error)
     }
     }
     }
     */
    
    ///Saving friends to Realm
    private func saveFriendsData(_ friends: [Friends]) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(friends, update: .modified)
            }
        } catch {
            print(error)
        }
    }
    
    func getGroupsInfo(for userID: Int, info: MethodsAPIVK) {
        
        let url = apiURL + info.method
        let parameters: Parameters = [
            "user_id": userID,
            "owner_id": userID,
            "fields": "description",
            "extended": "1",
            "access_token": session.token,
            "v": NetworkService.vkAPIVersion
        ]
        
        
        AF.request(url, method: .get, parameters: parameters).responseData { [weak self] response in
            switch response.result {
            case .success(let data):
                do {
                    let groups = try JSONDecoder().decode(GroupsResponse.self, from: data).items
                    self?.saveGroupsData(groups)
                } catch {
                    print("Error while decoding response from \(#function)")
                }
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    func searchGroupsInfo(for userID: Int, info: MethodsAPIVK, searchText: String, completion: @escaping([Groups]) -> Void) {
        
        let url = apiURL + info.method
        let parameters: Parameters = [
            "user_id": userID,
            "owner_id": userID,
//            "fields": "description",
//            "extended": "1",
            "q": searchText,
            "access_token": session.token,
            "v": NetworkService.vkAPIVersion
        ]
        
        
        AF.request(url, method: .get, parameters: parameters).responseData { [weak self] response in
            switch response.result {
            case .success(let data):
                do {
                    let searchGroups = try JSONDecoder().decode(GroupsResponse.self, from: data).items
                    completion(searchGroups)
                } catch {
                    print("Error while decoding response from \(#function)")
                }
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    ///Saving groups to Realm
    private func saveGroupsData(_ groups: [Groups]) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(groups, update: .all)
            }
        } catch {
            print(error)
        }
    }
    
    
    func getPhotosInfo(for userID: Int, info: MethodsAPIVK) {
        
        let url = apiURL + info.method
        let parameters: Parameters = [
            "user_id": userID,
            "owner_id": userID,
            // "fields": "description",
            "extended": "1",
            "access_token": session.token,
            "v": NetworkService.vkAPIVersion
        ]
        
        
        AF.request(url, method: .get, parameters: parameters).responseData { [weak self] response in
            switch response.result {
            case .success(let data):
                do {
                    let photos = try JSONDecoder().decode(PhotosResponse.self, from: data).items
                    self?.savePhotosData(photos)
                } catch {
                    let photos: [Photos] = []
                    self?.savePhotosData(photos)
                }
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    ///Saving photos to Realm
    private func savePhotosData(_ photos: [Photos]) {
        do {
            let realm = try Realm()
            try realm.write {
                let oldPhotos = realm.objects(Photos.self)
                realm.delete(oldPhotos)
                realm.add(photos, update: .all)
            }
        } catch {
            print(error)
        }
    }
    
    
    ///Getting search results
    func getInfo(for userID: Int, info: MethodsAPIVK, search searchText: String) {
        
        let url = apiURL + info.method
        let parameters: Parameters = [
            "user_id": userID,
            "owner_id": userID,
            "q": searchText,
            "access_token": session.token,
            "v": NetworkService.vkAPIVersion
        ]
        
        AF.request(url, method: .get, parameters: parameters).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let asJSON = try JSONSerialization.jsonObject(with: data)
                    print("\(info.description)\(asJSON)")
                    print(url)
                    print(self.session.token)
                } catch {
                    print("Error while decoding response: from: \(String(data: data, encoding: .utf8) ?? "")")
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    private func getInfoWithURLSession(for userID: Int, info: MethodsAPIVK) {
        let configuration = URLSessionConfiguration.default
        let urlSession = URLSession(configuration: configuration)
        
        var urlConstructor = URLComponents()
        urlConstructor.scheme = "https"
        urlConstructor.host = "api.vk.com"
        urlConstructor.path = "/method/"+info.method
        urlConstructor.queryItems = [
            URLQueryItem(name: "user_id", value: String(userID)),
            URLQueryItem(name: "access_token", value: session.token),
            URLQueryItem(name: "owner_id", value: String(userID)),
            URLQueryItem(name: "v", value: NetworkService.vkAPIVersion)
        ]
        
        let url = urlConstructor.url
        
        guard let url = url else { return }
        print(url)
        
        let task = urlSession.dataTask(with: url) { data, response, error in
            let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.fragmentsAllowed)
            print(json!)
        }
        task.resume()
    }
}
