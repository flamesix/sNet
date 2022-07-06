//
//  Groups.swift
//  sNet
//
//  Created by Юрий Гриневич on 02.05.2022.
//

import Foundation
import UIKit
import RealmSwift

protocol GroupsProtocol {
    var image: UIImage! { get }
    var name: String { get }
    var description: String { get }
}

class Groups: Object, Decodable {
    //    let image: UIImage!
    //    let name: String
    //    let description: String
    @Persisted var groupID: Int = 0
    @Persisted var groupName: String = ""
  //  @Persisted var groupDescription: String = ""
    @Persisted var groupsPhotoData: String = ""
    var groupsPhoto: UIImage = #imageLiteral(resourceName: "13")
    
    override class func primaryKey() -> String? {
        return "groupID"
    }
    
    enum CodingKeys: String, CodingKey {
        case groupID = "id"
        case groupName = "name"
    //    case groupDescription = "description"
        case groupsPhotoData = "photo_100"
    }
    
    convenience required init(from decoder: Decoder) throws {
        self.init()
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.groupID = try values.decode(Int.self, forKey: .groupID)
        self.groupName = try values.decode(String.self, forKey: .groupName)
     //   self.groupDescription = try values.decode(String.self, forKey: .groupDescription)
        self.groupsPhotoData = try values.decode(String.self, forKey: .groupsPhotoData)
        
    }
}
