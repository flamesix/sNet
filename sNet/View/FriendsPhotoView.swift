//
//  FriendsPhotoView.swift
//  sNet
//
//  Created by Юрий Гриневич on 14.05.2022.
//

import UIKit

class FriendsPhotoView: UIControl {

    @IBOutlet var userPhotoImageView: UIImageView!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupTap()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = frame.size.width / 2
       // layer.shadowRadius = userPhotoImageView.frame.size.width / 2
        layer.shadowOffset = .zero
        layer.shadowOpacity = 1
        layer.shadowColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
       
        userPhotoImageView.layer.cornerRadius = userPhotoImageView.frame.size.width / 2
        
        
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    
    

    private func setupTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(friendsPhotoTap))
        tap.numberOfTapsRequired = 1
        addGestureRecognizer(tap)
        
    }
    
    
    @objc private func friendsPhotoTap(_ tapGesture: UITapGestureRecognizer) {
        
        UIView.animate(withDuration: 0.4,
                       delay: 0,
                       usingSpringWithDamping: 0.1,
                       initialSpringVelocity: 0.1,
                       options: []) {
            self.userPhotoImageView.transform = CGAffineTransform.init(scaleX: 1.2, y: 1.2)
        } 

        sendActions(for: .valueChanged)
        
    }

}
