//
//  Friends.swift
//  sNet
//
//  Created by Юрий Гриневич on 01.05.2022.
//

import Foundation
import UIKit
import RealmSwift

protocol FriendsProtocol {
    var userID: String { get }
    var userPhoto: UIImage! { get }
    var name: String { get }
    var lastName: String { get }
    var icon: String { get }
}

protocol PhotosOfFriendProtocol {
    var photo: UIImage! { get }
}

class Friends: Object, Decodable {
    //    let userID: String
    //    let userPhoto: UIImage!
    //    let name: String
    //    let lastName: String
    //    let icon: String
    //    let photos: [PhotosOfFriend]
    
    @Persisted var userID: Int = 0
    @Persisted var firstName: String = ""
    @Persisted var lastName: String = ""
    @Persisted var userPhotoData: String = ""
    var userPhoto: UIImage = #imageLiteral(resourceName: "SNET.")
    
    enum CodingKeys: String, CodingKey {
        case userID = "id"
        case firstName = "first_name"
        case lastName = "last_name"
        case userPhotoData = "photo_100"
    }
    
    convenience required init(from decoder: Decoder) throws {
        self.init()
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.userID = try values.decode(Int.self, forKey: .userID)
        self.firstName = try values.decode(String.self, forKey: .firstName)
        self.lastName = try values.decode(String.self, forKey: .lastName)
        self.userPhotoData = try values.decode(String.self, forKey: .userPhotoData)
        //  self.userPhoto = UIImage(contentsOfFile: userPhotoData) ?? #imageLiteral(resourceName: "SNET.")
        
    }
    
//    var description: String {
//        //   "My photo \(icon)"
//        "My photo"
//    }
}

struct PhotosOfFriend: PhotosOfFriendProtocol {
    let photo: UIImage!
}
