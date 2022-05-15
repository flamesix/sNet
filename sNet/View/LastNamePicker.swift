//
//  LastNamePicker.swift
//  sNet
//
//  Created by Юрий Гриневич on 15.05.2022.
//

import UIKit

enum Letter {
    case A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z
    
    static let alphabet: [Letter] = [A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z]
    
    var letter: String {
        switch self {
        case .A:
            return "A"
        case .B:
            return "B"
        case .C:
            return "C"
        case .D:
            return "D"
        case .E:
            return "E"
        case .F:
            return "F"
        case .G:
            return "G"
        case .H:
            return "H"
        case .I:
            return "I"
        case .J:
            return "J"
        case .K:
            return "K"
        case .L:
            return "L"
        case .M:
            return "M"
        case .N:
            return "N"
        case .O:
            return "O"
        case .P:
            return "P"
        case .Q:
            return "Q"
        case .R:
            return "R"
        case .S:
            return "S"
        case .T:
            return "T"
        case .U:
            return "U"
        case .V:
            return "V"
        case .W:
            return "W"
        case .X:
            return "X"
        case .Y:
            return "Y"
        case .Z:
            return "Z"
        }
    }
}

class LastNamePicker: UIControl {
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}
