//
//  FriendsTableViewCell.swift
//  sNet
//
//  Created by Юрий Гриневич on 02.05.2022.
//

import UIKit
import Kingfisher

class FriendsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userPhotoImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        userPhotoImageView.kf.cancelDownloadTask()
        userPhotoImageView.image = nil
    }
    
    //    func updateFriendsTable(with friend: Friends) {
    //        iconLabel.text = friend.icon
    //        nameLabel.text = friend.name + " " + friend.lastName
    //        userPhotoImageView.image = friend.userPhoto
    //    }
    
    func updateFriendsTable(with friend: Friends) {
        iconLabel.text = ""
        nameLabel.text = friend.firstName + " " + friend.lastName
        // userPhotoImageView.image = friend.userPhoto
        
        
        if let url = URL(string: friend.userPhotoData) {
//            URLSession.shared.dataTask(with: url) { (data, urlResponse, error) in
//                if let data = data {
//                    DispatchQueue.main.async {
//                        friend.userPhoto = UIImage(data: data) ?? #imageLiteral(resourceName: "g3")
//                        self.userPhotoImageView.image = friend.userPhoto
//                    }
//                }
//            }.resume()
            userPhotoImageView.kf.setImage(with: url)
        }
    }
    
}
