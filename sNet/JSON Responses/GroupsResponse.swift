//
//  GroupsResponse.swift
//  sNet
//
//  Created by Юрий Гриневич on 17.06.2022.
//

import Foundation

class GroupsResponse: Decodable {
    var items: [Groups] = []
    
    enum CodingKeys: String, CodingKey {
        case response
    }
    
    enum ResponseKeys: String, CodingKey {
        case count
        case items
    }
    
    convenience required init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let responseValue = try values.nestedContainer(keyedBy: ResponseKeys.self, forKey: .response)
        let items = try responseValue.decode([Groups].self, forKey: .items)
        self.items = items
    }
}
