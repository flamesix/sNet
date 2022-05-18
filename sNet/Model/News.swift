//
//  News.swift
//  sNet
//
//  Created by Юрий Гриневич on 17.05.2022.
//

import Foundation
import UIKit

protocol NewsProtocol {
    var newsList: [String: [UIImage]] { get }
}

struct News {
    let newsList: [String: [UIImage]]
}
