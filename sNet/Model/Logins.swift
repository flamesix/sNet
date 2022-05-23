//
//  Logins.swift
//  sNet
//
//  Created by Юрий Гриневич on 05.05.2022.
//

import Foundation

protocol LoginProtocol {
    var login: String { get }
    var password: String { get }
}

struct Login: LoginProtocol {
    let login: String
    let password: String
}
