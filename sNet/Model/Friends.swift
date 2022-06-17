//
//  Friends.swift
//  sNet
//
//  Created by Юрий Гриневич on 01.05.2022.
//

import Foundation
import UIKit

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

class Friends: Decodable, CustomStringConvertible {
//    let userID: String
//    let userPhoto: UIImage!
//    let name: String
//    let lastName: String
//    let icon: String
//    let photos: [PhotosOfFriend]
    
    var userID: Int = 0
    var firstName: String = ""
    var lastName: String = ""

    enum CodingKeys: String, CodingKey {
        case userID = "id"
        case firstName = "first_name"
        case lastName = "last_name"
    }
    
    convenience required init(from decoder: Decoder) throws {
        self.init()

        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.userID = try values.decode(Int.self, forKey: .userID)
        self.firstName = try values.decode(String.self, forKey: .firstName)
        self.lastName = try values.decode(String.self, forKey: .lastName)
        
    }
    
    var description: String {
     //   "My photo \(icon)"
        "My photo"
    }
}

struct PhotosOfFriend: PhotosOfFriendProtocol {
    let photo: UIImage!
}
