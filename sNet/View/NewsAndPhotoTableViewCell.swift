//
//  NewsAndPhotoTableViewCell.swift
//  sNet
//
//  Created by Юрий Гриневич on 20.05.2022.
//

import UIKit

class NewsAndPhotoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userPhotoImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var dateCreatedLabel: UILabel!
    @IBOutlet weak var newsTextLabel: UILabel!
    
    @IBOutlet weak var firstNewsImage: UIImageView!
    @IBOutlet weak var secondNewsImage: UIImageView!
    @IBOutlet weak var thirdNewsImage: UIImageView!
    @IBOutlet weak var forthNewsImage: UIImageView!
    
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var repostButton: UIButton!
    
    @IBOutlet weak var counterLabel: UILabel!
    
    private var newsImages: [UIImageView] {
        
        [
            firstNewsImage,
            secondNewsImage,
            thirdNewsImage,
            forthNewsImage
        ]
    }
    
    var numberOfLikes = 100
    var numberOfCommets = 234
    var numberOfReposts = 23
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        userPhotoImage.layer.cornerRadius = userPhotoImage.frame.width / 2
        
        for newsImage in newsImages {
            newsImage.isHidden = true
        }
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
     
    
    @IBAction func likeButtonPressed(_ sender: UIButton) {
        numberOfLikes += 1
        likeButton.setTitle(String(numberOfLikes), for: .normal)
       }
    
    
    @IBAction func commentButtonPressed(_ sender: UIButton) {
        numberOfCommets += 1
        commentButton.setTitle(String(numberOfCommets), for: .normal)
    }
    
    
    @IBAction func repostButtonPressed(_ sender: UIButton) {
        numberOfReposts += 1
        repostButton.setTitle(String(numberOfReposts), for: .normal)
    }
    
    
    
    
//    func updateNews(with news: News) {
//        userPhotoImage.image = news.userPhotoImage
//        userNameLabel.text = news.userNameLabel
//        dateCreatedLabel.text = news.dateCreated.description
//        newsTextLabel.text = news.newsText
//        
//        for (newsImage, newsPhoto) in zip(newsImages, news.newsPhoto) {
//            if let newsPhoto = newsPhoto {
//                newsImage.isHidden = false
//                newsImage.image = newsPhoto.newsPhoto
//            }
//            
//        }
//    }
    
    func updateNewsT(with news: News) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM YYYY, HH:mm:ss"
        userPhotoImage.image = #imageLiteral(resourceName: "SNET.")
        userNameLabel.text = "TEST__TEST"
        dateCreatedLabel.text = dateFormatter.string(from: news.newsDate)
        newsTextLabel.text = news.newsDescription
        likeButton.setTitle(String(news.likesCount), for: .normal)
        repostButton.setTitle(String(news.repostsCount), for: .normal)
        commentButton.setTitle(String(news.commentsCount), for: .normal)
        counterLabel.text = String(news.viewsCount)
    }
}
