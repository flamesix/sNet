//
//  SearchGroupsResponse.swift
//  sNet
//
//  Created by Юрий Гриневич on 06.07.2022.
//

import Foundation

class SearchGroupsResponse: Decodable {
    var items: [SearchGroups] = []
    
    enum CodingKeys: String, CodingKey {
        case response
    }
    
    enum ResponseKeys: String, CodingKey {
        case count
        case items
    }
    
    convenience required init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let responseValue = try container.nestedContainer(keyedBy: ResponseKeys.self, forKey: .response)
        let items = try responseValue.decode([SearchGroups].self, forKey: .items)
        self.items = items
    }
}
