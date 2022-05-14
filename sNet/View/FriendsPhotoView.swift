//
//  FriendsPhotoView.swift
//  sNet
//
//  Created by Юрий Гриневич on 14.05.2022.
//

import UIKit

class FriendsPhotoView: UIView {

    @IBOutlet var userPhotoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
       // backgroundColor = .cyan
        userPhotoImageView.layer.shadowRadius = 16
    //    userPhotoImageView.layer.shadowOffset = CGSize(
        userPhotoImageView.layer.shadowOpacity = 0
        userPhotoImageView.layer.shadowColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
       
        userPhotoImageView.layer.cornerRadius = userPhotoImageView.frame.size.width / 2
        
        
    }
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    
    func updateFriendsPhotoImageView(with friend: Friends) {
        userPhotoImageView.image = friend.userPhoto
    }
    

}
