//
//  Session.swift
//  sNet
//
//  Created by Юрий Гриневич on 09.06.2022.
//

import Foundation

class Session {
    static let instance = Session()
    
    var token = ""
    var userID: Int = 689477392
    
    private init() { }
    
}
