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
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupGesture()
    }
    
    private func setupGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(likeTapped))
        tap.numberOfTapsRequired = 2
        addGestureRecognizer(tap)
        
        tap.cancelsTouchesInView = false
    }
    
    @objc private func likeTapped(_ tapGesture: UITapGestureRecognizer) {
        
        isLikePressed.toggle()
        
        if isLikePressed {
            likePhotoCountLabel.text = String(Int(likePhotoCountLabel.text ?? "0")! - 1)
            heartPhotoImage.image = UIImage(systemName: "heart")
            
            UIView.animate(withDuration: 0.2) {
                self.heartPhotoImage.transform = .identity
            }

        } else {
            likePhotoCountLabel.text = String(Int(likePhotoCountLabel.text ?? "0")! + 1)
            heartPhotoImage.image = UIImage(systemName: "heart.fill")
            UIView.animate(withDuration: 0.2) {
                self.heartPhotoImage.transform = self.transform.scaledBy(x: 1.3, y: 1.3)
            }
           
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
