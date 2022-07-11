//
//  NewsResponse.swift
//  sNet
//
//  Created by Юрий Гриневич on 08.07.2022.
//

import Foundation

class NewsResponse: Decodable {
    var items: [News] = []
    var groups: [Int: Groups] = [:]
    var profiles: [Int: Friends] = [:]
    
    enum CodingKeys: String, CodingKey {
        case response
    }
    
    enum ResponseKeys: String, CodingKey {
        case items
        case groups
        case profiles
    }
    
    convenience required init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let responseValue = try container.nestedContainer(keyedBy: ResponseKeys.self, forKey: .response)
        let items = try responseValue.decode([News].self, forKey: .items)
        self.items = items
        let groups = try responseValue.decode([Groups].self, forKey: .groups).reduce(into: [Int: Groups](), { partialResult, group in
            partialResult[group.groupID] = group
        })
        self.groups = groups
        let profiles = try responseValue.decode([Friends].self, forKey: .profiles).reduce(into: [Int: Friends](), { partialResult, profile in
            partialResult[profile.userID] = profile
        })
        self.profiles = profiles
        
    }
}
