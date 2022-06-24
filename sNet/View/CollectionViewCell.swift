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
//        collectionImage.image = #imageLiteral(resourceName: "SNET.")
        
        if let url = URL(string: photo.photoURL) {
//            URLSession.shared.dataTask(with: url) { (data, urlResponse, error) in
//                if let data = data {
//                    DispatchQueue.main.async {
//                        self.collectionImage.image = UIImage(data: data) ?? #imageLiteral(resourceName: "g3")
//                       // self.userPhotoImageView.image = friend.userPhoto
//                    }
//                }
//            }.resume()
            collectionImage.kf.setImage(with: url)
        }
    }
}
