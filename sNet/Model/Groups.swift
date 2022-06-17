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

class Groups: Decodable {
//    let image: UIImage!
//    let name: String
//    let description: String
    var groupID: Int = 0
    var groupName: String = ""
    var description: String = ""
    
    
    enum CodingKeys: String, CodingKey {
        case groupID = "id"
        case groupName = "name"
        case description
    }
    
    convenience required init(from decoder: Decoder) throws {
        self.init()

        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.groupID = try values.decode(Int.self, forKey: .groupID)
        self.groupName = try values.decode(String.self, forKey: .groupName)
        self.description = try values.decode(String.self, forKey: .description)
        
    }
}
