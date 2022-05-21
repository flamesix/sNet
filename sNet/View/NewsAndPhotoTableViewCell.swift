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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    
}
