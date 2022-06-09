//
//  CanvasViewController.swift
//  sNet
//
//  Created by Юрий Гриневич on 13.05.2022.
//

import UIKit

class CanvasViewController: UIViewController {

    @IBOutlet var drawingController: DrawingControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        drawingController.addTarget(self, action: #selector(drawDrawningChange), for: .valueChanged)
    }
    
    @objc private func drawDrawningChange() {
        drawingController.setNeedsDisplay()
        print(drawingController.isToggle)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        drawingController.setNeedsLayout()
        
//        drawingController.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2) //rotate object 90 grad
        
        drawingController.transform = CGAffineTransform(rotationAngle: CGFloat.pi/4).concatenating(CGAffineTransform(scaleX: 0.5, y: 0.5))
        
       // drawingController.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        
//        drawingController.transform = .identity // reset to initial settings
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
