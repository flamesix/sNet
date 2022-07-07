//
//  GroupsAdded.swift
//  sNet
//
//  Created by Юрий Гриневич on 06.07.2022.
//

import Foundation

struct GroupsAdded: Decodable {
    let userID: Int
    var groupsID: [Groups]
    
//    init(userID: Int, groupsID: Int) {
//        self.userID = userID
//        self.groupsID = groupsID
//    }
//
//    init(dict: Any) throws {
//
//        enum GroupsAddedError: Error {
//            case invalidDictType
//            case invalidUserIDType
//            case invalidGroupsAddedType
//        }
//
//        guard let dict = dict as? [String: Any] else {
//            throw GroupsAddedError.invalidDictType
//        }
//
//        guard let userID = dict["id"] as? Int else {
//            throw GroupsAddedError.invalidUserIDType
//        }
//
//        guard let groupsAdded = dict["groupID"] as? Int else {
//            throw GroupsAddedError.invalidGroupsAddedType
//        }
//
//       // let groupsID = try groupsAdded.compactMap { $0 }
//
//        self.userID = userID
//        self.groupsID = groupsAdded
//
//
//    }
    
    var toAnyObject: Any {
        return [
            "id": userID,
            "groupsInApp": groupsID.map { $0.groupID }
        ]
    }
}
