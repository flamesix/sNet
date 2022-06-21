//
//  Photos.swift
//  sNet
//
//  Created by Юрий Гриневич on 21.06.2022.
//

import Foundation
import UIKit

class Photos: Decodable {
    var photoDescription: String = ""
    var photoType: String = ""
    var photoURL: String = ""
    var photo: UIImage = #imageLiteral(resourceName: "SNET.")
    
    enum CodingKeys: String, CodingKey {
        case sizes
        case photoDescription = "text"
    }
    
    enum SizesCodingKeys: String, CodingKey {
        case photoType = "type"
        case photoURL = "url"
    }
    
    convenience required init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.photoDescription = try values.decode(String.self, forKey: .photoDescription)
//        let sizeValues = try decoder.container(keyedBy: SizesCodingKeys.self)
//        self.photoType = try sizeValues.decode(String.self, forKey: .photoType)
//        self.photoURL = try sizeValues.decode(String.self, forKey: .photoURL)
        
        var sizeValues = try values.nestedUnkeyedContainer(forKey: .sizes)

        _ = try sizeValues.nestedContainer(keyedBy: SizesCodingKeys.self)
        _ = try sizeValues.nestedContainer(keyedBy: SizesCodingKeys.self)
        _ = try sizeValues.nestedContainer(keyedBy: SizesCodingKeys.self)
        _ = try sizeValues.nestedContainer(keyedBy: SizesCodingKeys.self)
       
        let secondSize = try sizeValues.nestedContainer(keyedBy: SizesCodingKeys.self)
        self.photoType = try secondSize.decode(String.self, forKey: .photoType)
        self.photoURL = try secondSize.decode(String.self, forKey: .photoURL)
        
    }
}
