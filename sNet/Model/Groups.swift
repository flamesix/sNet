//
//  Groups.swift
//  sNet
//
//  Created by Юрий Гриневич on 02.05.2022.
//

import Foundation
import UIKit

protocol GroupsProtocol {
    var image: UIImage! { get }
    var name: String { get }
    var description: String { get }
}

struct Groups: GroupsProtocol {
    let image: UIImage!
    let name: String
    let description: String
}
