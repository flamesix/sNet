//
//  NetworkService.swift
//  sNet
//
//  Created by Юрий Гриневич on 14.06.2022.
//

import Foundation
import Alamofire

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
    
    private let session = Session.instance
    
    private let apiURL = "https://api.vk.com/method/"
    private let method: MethodsAPIVK = .friendList
    
    ///Getting info for specifid userID
    func getInfo(for userID: Int, info: MethodsAPIVK) {
        
        let url = apiURL + info.method
        let parameters: Parameters = [
            "user_id": userID,
            "owner_id": userID,
            "access_token": session.token,
            "v": "5.131"
        ]
        
        AF.request(url, method: .get, parameters: parameters).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let asJSON = try JSONSerialization.jsonObject(with: data)
                    print("\(info.description)\(asJSON)")
                } catch {
                    print("Error while decoding response: from: \(String(data: data, encoding: .utf8) ?? "")")
                }
            case .failure(let error):
                print(error)
            }
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
            "v": "5.131"
        ]
        
        AF.request(url, method: .get, parameters: parameters).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let asJSON = try JSONSerialization.jsonObject(with: data)
                    print("\(info.description)\(asJSON)")
                } catch {
                    print("Error while decoding response: from: \(String(data: data, encoding: .utf8) ?? "")")
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
