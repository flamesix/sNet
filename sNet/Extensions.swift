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

extension UITextField {

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
    
    ///Set button with system images to the right of text field
    func setRightButton(systemName: String) {

        let button = UIButton(type: .custom)
        button.addTarget(self, action: #selector(showHidePassword), for: .touchUpInside)
        button.tintColor = .lightGray
        button.setImage(UIImage(systemName: systemName), for: .normal)
        self.rightView = button
        self.rightViewMode = .always
        
    }
    
    @objc func showHidePassword(sender: UIButton!) {
        self.isSecureTextEntry.toggle()
               if self.isSecureTextEntry {
                   sender.setImage(UIImage(systemName: "eye.fill"), for: .normal)
               } else {
                   sender.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
               }
     }
}

// MARK: - Extension Adjust Keyboard for ScrollView
extension UIScrollView {
    
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector:
                                                #selector(keyboardWasShown(_:)),
                                               name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector:
                                                #selector(keyboardWillBeHidden(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
        
    }
    
    @objc func keyboardWasShown(_ notificiation: NSNotification) {
        guard let info = notificiation.userInfo,
              let keyboardFrameValue =
                info[UIResponder.keyboardFrameBeginUserInfoKey]
                as? NSValue else { return }
        
        let keyboardFrame = keyboardFrameValue.cgRectValue
        let keyboardSize = keyboardFrame.size
        
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0,
                                         bottom: keyboardSize.height, right: 0.0)
        self.contentInset = contentInsets
        self.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillBeHidden(_ notification:
                                    NSNotification) {
        let contentInsets = UIEdgeInsets.zero
        self.contentInset = contentInsets
        self.scrollIndicatorInsets = contentInsets
    }
    
}
