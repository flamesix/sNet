//
//  Friends.swift
//  sNet
//
//  Created by Юрий Гриневич on 01.05.2022.
//

import Foundation
import UIKit

protocol FriendsProtocol {
    var userPhoto: UIImage! { get }
    var name: String { get }
    var lastName: String { get }
    var icon: String { get }
}

struct Friends: FriendsProtocol {
    let userPhoto: UIImage!
    let name: String
    let lastName: String
    let icon: String
}
