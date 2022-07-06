//
//  SearchGroups.swift
//  sNet
//
//  Created by Юрий Гриневич on 06.07.2022.
//

import Foundation
import UIKit

class SearchGroups: Decodable {
    
    var searchGroupID: Int = 0
    var searchGroupName: String = ""
    var searchGroupDescription: String = ""
    var searchGroupsPhotoData: String = ""
    var groupsPhoto: UIImage = #imageLiteral(resourceName: "1")
    
    enum CodingKeys: String, CodingKey {
        case searchGroupID = "id"
        case searchGroupName = "name"
        case searchGroupDescription = "screen_name"
        case searchGroupsPhotoData = "photo_100"
    }
    
    convenience required init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.searchGroupID = try container.decode(Int.self, forKey: .searchGroupID)
        self.searchGroupName = try container.decode(String.self, forKey: .searchGroupName)
        self.searchGroupDescription = try container.decode(String.self, forKey: .searchGroupDescription)
        self.searchGroupsPhotoData = try container.decode(String.self, forKey: .searchGroupsPhotoData)
    }
}
