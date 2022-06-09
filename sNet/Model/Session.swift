//
//  Session.swift
//  sNet
//
//  Created by Юрий Гриневич on 09.06.2022.
//

import Foundation

class Session {
    static let instance = Session(token: "", userID: 0)
    
    var token: String?
    var userID: Int?
    
    private init(token: String, userID: Int) {
        self.token = token
        self.userID = userID
    }
    
}
