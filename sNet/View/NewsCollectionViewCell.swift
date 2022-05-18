//
//  NewsCollectionViewCell.swift
//  sNet
//
//  Created by Юрий Гриневич on 17.05.2022.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var newsPhotoImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    func updateNewsCollectionViewCell(with friend: Friends) {
        newsPhotoImage.image = friend.userPhoto
    }

}
