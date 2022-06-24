//
//  PhotosResponse.swift
//  sNet
//
//  Created by Юрий Гриневич on 21.06.2022.
//

import Foundation

class PhotosResponse: Decodable {
    var items: [Photos] = []
    
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
       let items = try responseValue.decode([Photos].self, forKey: .items)
       self.items = items
    }
    
}
