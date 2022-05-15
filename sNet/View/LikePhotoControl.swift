//
//  LikePhotoControl.swift
//  sNet
//
//  Created by Юрий Гриневич on 15.05.2022.
//

import UIKit

class LikePhotoControl: UIControl {
    
    var isLikePressed: Bool = true
    

    @IBOutlet var likePhotoCountLabel: UILabel!
    @IBOutlet var heartPhotoImage: UIImageView!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupGesture()
    }
    
    private func setupGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(likeTapped))
        tap.numberOfTapsRequired = 2
        addGestureRecognizer(tap)
    }
    
    @objc private func likeTapped(_ tapGesture: UITapGestureRecognizer) {
        
        isLikePressed.toggle()
        
        if isLikePressed {
            likePhotoCountLabel.text = "0"
            heartPhotoImage.image = UIImage(systemName: "heart")
        } else {
            likePhotoCountLabel.text = "1"
            heartPhotoImage.image = UIImage(systemName: "heart.fill")
        }
        
        sendActions(for: .valueChanged)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
