//
//  FriendsResponse.swift
//  sNet
//
//  Created by Юрий Гриневич on 17.06.2022.
//

import Foundation

class FriendsResponse: Decodable {
    var items: [Friends] = []
    
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
        let items = try responseValue.decode([Friends].self, forKey: .items)
        self.items = items
        
     }
}
