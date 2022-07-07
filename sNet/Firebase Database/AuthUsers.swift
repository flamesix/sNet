//
//  AuthUsers.swift
//  sNet
//
//  Created by Юрий Гриневич on 05.07.2022.
//

import Foundation

struct AuthUsers: Codable {
    let userID: Int
    
    init(userID: Int) {
        self.userID = userID
    }
    
    init(dict: Any) throws {
        
        enum AuthUserError: Error {
            case invalidDictType
            case invalidUserIDType
        }
        
        guard let dict = dict as? [String: Any] else {
            throw AuthUserError.invalidDictType
        }
        
        guard let userID = dict["id"] as? Int else {
            throw AuthUserError.invalidUserIDType
        }
        self.userID = userID
    }
    
    var toAnyObject: Any {
        [
            "id": userID
        ]
    }
}
