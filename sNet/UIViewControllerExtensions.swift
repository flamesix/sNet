//
//  UIViewControllerExtensions.swift
//  sNet
//
//  Created by Юрий Гриневич on 30.04.2022.
//

import Foundation
import UIKit

extension UIViewController {
    /// Call this once to dismiss open keyboards by tapping anywhere in the view controller
    func setupHideKeyboardOnTap() {
        self.view.addGestureRecognizer(self.endEditingRecognizer())
        self.navigationController?.navigationBar.addGestureRecognizer(self.endEditingRecognizer())
    }
    
    /// Dismisses the keyboard from self.view
    private func endEditingRecognizer() -> UIGestureRecognizer {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(self.view.endEditing(_:)))
        tap.cancelsTouchesInView = false
        return tap
    }
    
    /// Login is incorret Alert
    func showLoginAlert(message: String) {
        let alert = UIAlertController(title: "Error",
                                      message: message,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "OK",
                                   style: .default,
                                   handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

extension UITextField{

    ///Set system images to the left of text field
    func setLeftImage(systemName: String) {

        //let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: systemName)
        imageView.tintColor = .lightGray
        self.leftView = imageView;
        self.leftViewMode = .always
    }
    
    //Set system images to the right of text field
    func setRightImage(systemName: String) {

       // let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: systemName)
        imageView.tintColor = .lightGray
        self.rightView = imageView;
        self.rightViewMode = .always
    }
    
    /////Set button with system images to the right of text field
//    func setRightButton(systemName: String) {
//
//        let button = UIButton(type: .custom)
//       // button.addTarget(self, action: , for: .touchUpInside)
//        button.addTarget(self, action: "showHidePassword", for: .touchUpInside)
//        button.tintColor = .lightGray
//        button.setImage(UIImage(systemName: systemName), for: .normal)
//        self.rightView = button
//        self.rightViewMode = .always
//        
////        func showHidePassword(sender: UIButton!) {
////            print("Button tapped")
////         }
//    }
}
