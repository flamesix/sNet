//
//  CollectionViewCell.swift
//  sNet
//
//  Created by Юрий Гриневич on 02.05.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var collectionPhotoLabel: UILabel!
    @IBOutlet weak var collectionImage: UIImageView!
    
    
//    func updatePhoto(with friend: Friends) {
//        collectionPhotoLabel.text = friend.description
//        collectionImage.image = friend.userPhoto
//    }
    
    func updatePhoto(with photo: PhotosOfFriend, with friend: Friends) {
        collectionPhotoLabel.text = friend.description
        collectionImage.image = photo.photo
    }
}
