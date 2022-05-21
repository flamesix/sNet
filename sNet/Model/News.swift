//
//  News.swift
//  sNet
//
//  Created by Юрий Гриневич on 17.05.2022.
//

import Foundation
import UIKit

protocol NewsProtocol {
    var userPhotoImage: UIImage! { get }
    var userNameLabel: String { get }
    var dateCreated: Date { get }
    var newsText: String { get }
}

struct News: NewsProtocol {
    var userPhotoImage: UIImage!
    var userNameLabel: String
    var dateCreated: Date
    var newsText: String
    var newsPhoto: [NewsPhoto?]
    
}

protocol NewsPhotoProtocol {
    var newsPhoto: UIImage! { get }
}

struct NewsPhoto: NewsPhotoProtocol {
    var newsPhoto: UIImage!
}



