//
//  SecondLoginViewController.swift
//  sNet
//
//  Created by Юрий Гриневич on 04.05.2022.
//

import UIKit

class SecondLoginViewController: UIViewController {
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // passwordTextField.setRightButton(systemName: "eye.fill")
        let showHidePasswordButton = UIButton(type: .custom)
        
        showHidePasswordButton.addTarget(self, action: #selector(showHidePassword), for: .touchUpInside)
        showHidePasswordButton.tintColor = .lightGray
        showHidePasswordButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        passwordTextField.rightView = showHidePasswordButton
        passwordTextField.rightViewMode = .always
    
        
        
    }
    
    @objc func showHidePassword(sender: UIButton!) {
        passwordTextField.isSecureTextEntry.toggle()
               if passwordTextField.isSecureTextEntry {
                   sender.setImage(UIImage(systemName: "eye.fill"), for: .normal)
               } else {
                   sender.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
               }
     }
    
    @IBAction func enterButtonPressed(_ sender: UIButton) {
    }
    
    
//    @IBAction func showHidePassword(_ sender: UIButton) {
//        passwordTextField.isSecureTextEntry.toggle()
//        if passwordTextField.isSecureTextEntry {
//            passwordTextField.setRightButton(systemName: "eye.slash.fill")
//        } else {
//            passwordTextField.setRightButton(systemName: "eye.slash.fill")
//        }
//    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
