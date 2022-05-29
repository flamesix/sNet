//
//  LoginLoadingView.swift
//  sNet
//
//  Created by Юрий Гриневич on 22.05.2022.
//

import UIKit

class LoginLoadingView: UIView {

    @IBOutlet var firstDotImage: UIImageView!
    @IBOutlet var secondDotImage: UIImageView!
    @IBOutlet var thirdDotImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
     
        animateDot(dot: firstDotImage, delay: 0.33)
        animateDot(dot: secondDotImage, delay: 0.66)
        animateDot(dot: thirdDotImage, delay: 0.99)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.isHidden = true
        }
        
    }
    
    
    private func animateDot(dot: UIImageView, delay: TimeInterval) {
        UIView.animate(withDuration: 1,
                       delay: delay,
                       options: [.repeat, .autoreverse]) {
            dot.alpha = 0.5
        }
    }
    
    

}
