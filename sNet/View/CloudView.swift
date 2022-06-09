//
//  CloudView.swift
//  sNet
//
//  Created by Юрий Гриневич on 04.06.2022.
//

import UIKit

class CloudView: UIView {
    
    
    let animationsGroup = CAAnimationGroup()
    
//        override init(frame: CGRect) {
//            super.init(frame: frame)
//            setup()
//        }
//    
//    
//        required init?(coder: NSCoder) {
//            super.init(coder: coder)
//            setup()
//        }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = UIColor.clear

        
    }
    
    func setup() {
        
        let shapeLayer = CAShapeLayer()
        
        shapeLayer.path = createCloudLogo().cgPath
        shapeLayer.strokeStart = 0
        shapeLayer.strokeEnd = 1
        shapeLayer.lineWidth = 10
        shapeLayer.lineCap = .round
        shapeLayer.strokeColor = UIColor.systemGray6.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        
        self.layer.addSublayer(shapeLayer)
        
        let lineStartAnimation = CABasicAnimation(keyPath: #keyPath(CAShapeLayer.strokeStart))
        lineStartAnimation.fromValue = -1
        lineStartAnimation.toValue = 0
        lineStartAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        
        let lineEndAnimation = CABasicAnimation(keyPath: #keyPath(CAShapeLayer.strokeEnd))
        lineEndAnimation.fromValue = 0
        lineEndAnimation.toValue = 1
        lineEndAnimation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        //  lineAnimation.duration = 4
        
        //  layer.add(lineAnimation, forKey: nil)
        animationsGroup.animations = [lineStartAnimation, lineEndAnimation]
        animationsGroup.duration = 4
        animationsGroup.repeatCount = .infinity
        
        shapeLayer.add(animationsGroup, forKey: nil)
    }
    
    
    override func draw(_ rect: CGRect) {
        setup()
    }
    

    
    func createCloudLogo() -> UIBezierPath {
        
        let bezier2Path = UIBezierPath()
        bezier2Path.move(to: CGPoint(x: 164.1, y: 46.28))
        bezier2Path.addCurve(to: CGPoint(x: 164.1, y: 129.72), controlPoint1: CGPoint(x: 197.3, y: 69.32), controlPoint2: CGPoint(x: 197.3, y: 106.68))
        bezier2Path.addCurve(to: CGPoint(x: 87.68, y: 145.91), controlPoint1: CGPoint(x: 143.34, y: 144.13), controlPoint2: CGPoint(x: 114.5, y: 149.53))
        bezier2Path.addCurve(to: CGPoint(x: 41.5, y: 167.5), controlPoint1: CGPoint(x: 69.56, y: 157.66), controlPoint2: CGPoint(x: 41.5, y: 167.5))
        bezier2Path.addCurve(to: CGPoint(x: 56.33, y: 136.86), controlPoint1: CGPoint(x: 41.5, y: 167.5), controlPoint2: CGPoint(x: 51.16, y: 151.11))
        bezier2Path.addCurve(to: CGPoint(x: 43.9, y: 129.72), controlPoint1: CGPoint(x: 51.95, y: 134.8), controlPoint2: CGPoint(x: 47.78, y: 132.42))
        bezier2Path.addCurve(to: CGPoint(x: 43.9, y: 46.28), controlPoint1: CGPoint(x: 10.7, y: 106.68), controlPoint2: CGPoint(x: 10.7, y: 69.32))
        bezier2Path.addCurve(to: CGPoint(x: 164.1, y: 46.28), controlPoint1: CGPoint(x: 77.09, y: 23.24), controlPoint2: CGPoint(x: 130.91, y: 23.24))
        bezier2Path.close()
        bezier2Path.stroke()
//         UIColor.red.setStroke()
//           bezier2Path.lineWidth = 9
        return bezier2Path
    }
    
}
