//
//  NewsResponse.swift
//  sNet
//
//  Created by Юрий Гриневич on 08.07.2022.
//

import Foundation

class NewsResponse: Decodable {
    var items: [News] = []
    
    enum CodingKeys: String, CodingKey {
        case response
    }
    
    enum ResponseKeys: String, CodingKey {
        case items
    }
    
    convenience required init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let responseValue = try container.nestedContainer(keyedBy: ResponseKeys.self, forKey: .response)
        let items = try responseValue.decode([News].self, forKey: .items)
        self.items = items
    }
}
