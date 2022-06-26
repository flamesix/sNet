//
//  CloudView.swift
//  sNet
//
//  Created by Юрий Гриневич on 04.06.2022.
//

import UIKit

class CloudView: UIView {

    var path: UIBezierPath!
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
      createCloud()
        UIColor.orange.setFill()
            path.fill()
         
            // Specify a border (stroke) color.
            UIColor.purple.setStroke()
            path.stroke()
    }
    
    func createCloud() {
        

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
       // UIColor.red.setStroke()
       // bezier2Path.lineWidth = 9
        bezier2Path.stroke()

           
        
    }
    

}
