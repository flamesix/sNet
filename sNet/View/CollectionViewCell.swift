//
//  CollectionViewCell.swift
//  sNet
//
//  Created by Юрий Гриневич on 02.05.2022.
//

import UIKit
import Kingfisher

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var collectionPhotoLabel: UILabel!
    @IBOutlet weak var collectionImage: UIImageView!
    
    
    //    func updatePhoto(with friend: Friends) {
    //        collectionPhotoLabel.text = friend.description
    //        collectionImage.image = friend.userPhoto
    //    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        collectionImage.kf.cancelDownloadTask()
        collectionImage.image = nil
    }
    
    
    func updatePhoto(with photo: PhotosOfFriend, with friend: Friends) {
        collectionPhotoLabel.text = friend.description
        collectionImage.image = photo.photo
    }
    
    func updatePhoto(with photo: Photos) {
        collectionPhotoLabel.text = photo.photoDescription
  
        guard let urlSting = photo.photoDict["x"],
              let url = URL(string: urlSting) else { return }
        
        collectionImage.kf.setImage(with: url)
        
    }
}
