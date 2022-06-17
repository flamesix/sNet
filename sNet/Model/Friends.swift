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

struct Friends: FriendsProtocol, CustomStringConvertible {
    let userID: String
    let userPhoto: UIImage!
    let name: String
    let lastName: String
    let icon: String
    let photos: [PhotosOfFriend]
    
    var description: String {
        "My photo \(icon)"
    }
}

struct PhotosOfFriend: PhotosOfFriendProtocol {
    let photo: UIImage!
}

class FrendsList: Decodable {
    let userID: Int
    let firstName: String
    let lastName: String
    
    enum CodingKeys: String, CodingKey {
        case userID = "id"
        case firstName = "first_name"
        case lastName = "last_name"
    }
   
    init(userID: Int, firstName: String, lastName: String) {
        self.userID = userID
        self.firstName = firstName
        self.lastName = lastName
    }
}
