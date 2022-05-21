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
    
    func updateNews(with news: News) {
        userPhotoImage.image = news.userPhotoImage
        userNameLabel.text = news.userNameLabel
        dateCreatedLabel.text = news.dateCreated.description
        newsTextLabel.text = news.newsText
        
        for (newsImage, newsPhoto) in zip(newsImages, news.newsPhoto) {
            if let newsPhoto = newsPhoto {
                newsImage.isHidden.toggle()
                newsImage.image = newsPhoto.newsPhoto
            }
            
        }
        
    }
}
