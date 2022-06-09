//
//  DrawingControl.swift
//  sNet
//
//  Created by Юрий Гриневич on 13.05.2022.
//

import UIKit

class DrawingControl: UIControl {

    @IBInspectable var isToggle: Bool = true
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGesture()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupGesture()
    }
    
    private func setupGesture() {
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(swiped(_:)))
        swipe.direction = .left
        addGestureRecognizer(swipe)
    }
    
    @objc private func swiped(_ swipeGesture: UISwipeGestureRecognizer) {
        print(#function)
        isToggle.toggle()
        
        sendActions(for: .valueChanged)
    }
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else {return}
        
       // let colorOne: CGColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        
        let color: UIColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)

        context.setFillColor(color.cgColor)
        
        context.saveGState() // save setting
        
        if isToggle {
        let rectangleRed = CGRect(x: rect.width/2,
                                  y: rect.height/2,
                                  width: rect.height/4,
                                  height: rect.width/4)
        
        context.fill(rectangleRed)
        }
        
        context.move(to: CGPoint(x: rect.width/2, y: 0))
        context.addLine(to: CGPoint(x: rect.width/2, y: rect.height/2))
        context.addLine(to: CGPoint(x: 0, y: rect.height/2))
        
        context.closePath()
        
        context.setFillColor(UIColor.yellow.cgColor)
        context.setStrokeColor(UIColor.yellow.cgColor)
        
        context.strokePath()
        
        context.restoreGState() // reset settings
        
        
        let triangle = UIBezierPath()
        
        triangle.move(to: CGPoint(x: 0, y: rect.height/2))
        triangle.addLine(to: CGPoint(x: 0, y: rect.height))
        triangle.addLine(to: CGPoint(x: rect.height/2, y: rect.height))
        
        triangle.close()
        
        context.addPath(triangle.cgPath)
        context.fillPath()
        
        //тень вокруг объекта
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.6
    }
    

}
