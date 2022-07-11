//
//  News.swift
//  sNet
//
//  Created by Юрий Гриневич on 17.05.2022.
//

import Foundation
import UIKit

class News: Decodable {
    var newsDescription: String = ""
    var newsDate: Date = Date.now
    var commentsCount: Int = 0
    var likesCount: Int = 0
    var repostsCount: Int = 0
    var viewsCount: Int = 0
    var sourceID: Int = 0
    
    enum CodingKeys: String, CodingKey {
        case newsDescription = "text"
        case newsDate = "date"
        case commentsCount = "count"
        case likes
        case reposts
        case views
        case sourceID = "source_id"
    }
    
    enum LikesKeys: String, CodingKey {
        case likesCount = "count"
    }
    
    enum RepostsCount: String, CodingKey {
        case repostsCount = "count"
    }
    
    enum ViewsCount: String, CodingKey {
        case viewsCount = "count"
    }
    
    convenience required init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.newsDescription = try container.decode(String.self, forKey: .newsDescription)
        self.newsDate = try container.decode(Date.self, forKey: .newsDate)
        let commentsValue = try container.nestedContainer(keyedBy: LikesKeys.self, forKey: .likes)
        self.likesCount = try commentsValue.decode(Int.self, forKey: .likesCount)
        let repostsValue = try container.nestedContainer(keyedBy: RepostsCount.self, forKey: .reposts)
        self.repostsCount = try repostsValue.decode(Int.self, forKey: .repostsCount)
        let viewsValue = try container.nestedContainer(keyedBy: ViewsCount.self, forKey: .views)
        self.viewsCount = try viewsValue.decode(Int.self, forKey: .viewsCount)
        self.sourceID = try container.decode(Int.self, forKey: .sourceID)
    }
}


//protocol NewsProtocol {
//    var userPhotoImage: UIImage! { get }
//    var userNameLabel: String { get }
//    var dateCreated: Date { get }
//    var newsText: String { get }
//}
//
//struct News: NewsProtocol {
//    var userPhotoImage: UIImage!
//    var userNameLabel: String
//    var dateCreated: Date
//    var newsText: String
//    var newsPhoto: [NewsPhoto?]
//
//}
//
//protocol NewsPhotoProtocol {
//    var newsPhoto: UIImage! { get }
//}
//
//struct NewsPhoto: NewsPhotoProtocol {
//    var newsPhoto: UIImage!
//}



