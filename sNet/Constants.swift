//
//  Constants.swift
//  sNet
//
//  Created by Юрий Гриневич on 01.05.2022.
//

import Foundation

enum Constants {
    case friendCell
    case groupCell
    case searchGroup
    
    var value: String {
        switch self {
        case .friendCell:
            return "friendCell"
        case .groupCell:
            return "groupCell"
        case .searchGroup:
            return "searchGroup"
        }
    }
}
