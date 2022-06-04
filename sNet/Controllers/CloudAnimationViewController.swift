//
//  CloudAnimationViewController.swift
//  sNet
//
//  Created by Юрий Гриневич on 29.05.2022.
//

import UIKit

class CloudAnimationViewController: UIViewController {
    
    @IBOutlet weak var cloudView: UIView!
    
    let layer = CAShapeLayer()
    let animationsGroup = CAAnimationGroup()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        layer.path = cloudLogo.cgPath
        layer.strokeStart = 0
        layer.strokeEnd = 1
        layer.lineWidth = 10
        layer.lineCap = .round
        layer.strokeColor = UIColor.systemGray6.cgColor
        layer.fillColor = UIColor.clear.cgColor
        
        
        cloudView.layer.addSublayer(layer)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
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
        
        layer.add(animationsGroup, forKey: nil)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.performSegue(withIdentifier: PropertyKeys.cloudAnimationToLoginSegue, sender: nil)
        }
    }
    
    /*
    let cloudLogo: UIBezierPath = {
        let bezierPath = UIBezierPath()
        
        bezierPath.move(to: CGPoint(x: 103.5, y: 77.5))
        bezierPath.addLine(to: CGPoint(x: 99.5, y: 74.5))
        bezierPath.addLine(to: CGPoint(x: 96.5, y: 74.5))
        bezierPath.addLine(to: CGPoint(x: 92.5, y: 74.5))
        bezierPath.addLine(to: CGPoint(x: 87.5, y: 74.5))
        bezierPath.addLine(to: CGPoint(x: 83.5, y: 74.5))
        bezierPath.addLine(to: CGPoint(x: 78.5, y: 74.5))
        bezierPath.addLine(to: CGPoint(x: 72.5, y: 77.5))
        bezierPath.addLine(to: CGPoint(x: 68.5, y: 81.5))
        bezierPath.addLine(to: CGPoint(x: 65.5, y: 85.5))
        bezierPath.addLine(to: CGPoint(x: 61.5, y: 90.5))
        bezierPath.addLine(to: CGPoint(x: 61.5, y: 94.5))
        bezierPath.addLine(to: CGPoint(x: 58.5, y: 98.5))
        bezierPath.addLine(to: CGPoint(x: 55.5, y: 98.5))
        bezierPath.addLine(to: CGPoint(x: 50.5, y: 98.5))
        bezierPath.addLine(to: CGPoint(x: 46.5, y: 98.5))
        bezierPath.addLine(to: CGPoint(x: 42.5, y: 98.5))
        bezierPath.addLine(to: CGPoint(x: 38.5, y: 101.5))
        bezierPath.addLine(to: CGPoint(x: 34.5, y: 104.5))
        bezierPath.addLine(to: CGPoint(x: 30.5, y: 108.5))
        bezierPath.addLine(to: CGPoint(x: 27.5, y: 113.5))
        bezierPath.addLine(to: CGPoint(x: 27.5, y: 118.5))
        bezierPath.addLine(to: CGPoint(x: 27.5, y: 124.5))
        bezierPath.addLine(to: CGPoint(x: 27.5, y: 129.5))
        bezierPath.addLine(to: CGPoint(x: 30.5, y: 133.5))
        bezierPath.addLine(to: CGPoint(x: 34.5, y: 139.5))
        bezierPath.addLine(to: CGPoint(x: 38.5, y: 143.5))
        bezierPath.addLine(to: CGPoint(x: 46.5, y: 146.5))
        bezierPath.addLine(to: CGPoint(x: 50.5, y: 146.5))
        bezierPath.addLine(to: CGPoint(x: 178.5, y: 146.5))
        bezierPath.addLine(to: CGPoint(x: 185.5, y: 143.5))
        bezierPath.addLine(to: CGPoint(x: 190.5, y: 139.5))
        bezierPath.addLine(to: CGPoint(x: 195.5, y: 133.5))
        bezierPath.addLine(to: CGPoint(x: 198.5, y: 124.5))
        bezierPath.addLine(to: CGPoint(x: 198.5, y: 118.5))
        bezierPath.addLine(to: CGPoint(x: 198.5, y: 113.5))
        bezierPath.addLine(to: CGPoint(x: 198.5, y: 104.5))
        bezierPath.addLine(to: CGPoint(x: 195.5, y: 101.5))
        bezierPath.addLine(to: CGPoint(x: 190.5, y: 94.5))
        bezierPath.addLine(to: CGPoint(x: 185.5, y: 90.5))
        bezierPath.addLine(to: CGPoint(x: 181.5, y: 90.5))
        bezierPath.addLine(to: CGPoint(x: 178.5, y: 90.5))
        bezierPath.addLine(to: CGPoint(x: 174.5, y: 90.5))
        bezierPath.addLine(to: CGPoint(x: 174.5, y: 81.5))
        bezierPath.addLine(to: CGPoint(x: 174.5, y: 77.5))
        bezierPath.addLine(to: CGPoint(x: 170.5, y: 71.5))
        bezierPath.addLine(to: CGPoint(x: 167.5, y: 66.5))
        bezierPath.addLine(to: CGPoint(x: 163.5, y: 61.5))
        bezierPath.addLine(to: CGPoint(x: 159.5, y: 57.5))
        bezierPath.addLine(to: CGPoint(x: 155.5, y: 54.5))
        bezierPath.addLine(to: CGPoint(x: 149.5, y: 51.5))
        bezierPath.addLine(to: CGPoint(x: 145.5, y: 51.5))
        bezierPath.addLine(to: CGPoint(x: 138.5, y: 51.5))
        bezierPath.addLine(to: CGPoint(x: 135.5, y: 51.5))
        bezierPath.addLine(to: CGPoint(x: 130.5, y: 51.5))
        bezierPath.addLine(to: CGPoint(x: 125.5, y: 51.5))
        bezierPath.addLine(to: CGPoint(x: 119.5, y: 54.5))
        bezierPath.addLine(to: CGPoint(x: 116.5, y: 57.5))
        bezierPath.addLine(to: CGPoint(x: 113.5, y: 61.5))
        bezierPath.addLine(to: CGPoint(x: 109.5, y: 66.5))
        bezierPath.addLine(to: CGPoint(x: 106.5, y: 71.5))
        bezierPath.addLine(to: CGPoint(x: 103.5, y: 77.5))
        bezierPath.close()
        UIColor.black.setStroke()
        bezierPath.lineWidth = 2
        bezierPath.lineCapStyle = .round
        bezierPath.stroke()

        return bezierPath
    }()
    */
    
    
    
    let cloudLogo: UIBezierPath = {
        
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
    UIColor.red.setStroke()
    bezier2Path.lineWidth = 9
    bezier2Path.stroke()
        
        return bezier2Path
    }()
    
}

extension CloudAnimationViewController: UIViewControllerTransitioningDelegate {
    
}
