//
//  NewsTableViewCell.swift
//  sNet
//
//  Created by Юрий Гриневич on 15.05.2022.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var userPhotoView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userPhotoImage: UIImageView!
    @IBOutlet weak var timeCreatedLabel: UILabel!
    @IBOutlet weak var newsLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        userPhotoView.layer.cornerRadius = userPhotoView.frame.size.width / 2
        userPhotoImage.layer.cornerRadius = userPhotoImage.frame.size.width / 2
        userPhotoView.layer.shadowRadius = userPhotoImage.frame.size.width / 2
        userPhotoView.layer.shadowColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        userPhotoView.layer.shadowOpacity = 0.7
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
}
