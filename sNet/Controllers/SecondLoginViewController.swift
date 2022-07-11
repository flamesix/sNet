//
//  SecondLoginViewController.swift
//  sNet
//
//  Created by Юрий Гриневич on 04.05.2022.
//

import UIKit
import FirebaseAuth

class SecondLoginViewController: UIViewController {
    
    let login: [LoginProtocol] = []
    
    var updatingData: String = ""
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordTextField.setRightButton(systemName: "eye.fill")
        passwordTextField.autocorrectionType = .no
        self.setupHideKeyboardOnTap()
        scrollView.registerForKeyboardNotifications()
        updateLoginTextField(with: updatingData)
    }
    
    func updateLoginTextField(with text: String) {
        loginTextField.text = text
    }

    
    @IBAction func enterButtonPressed(_ sender: UIButton) {
        guard let login = loginTextField.text,
              let password = passwordTextField.text else { return }
        Auth.auth().signIn(withEmail: login, password: password) { [weak self] authResult, error in
            if let error = error {
                self?.showLoginAlert(message: error.localizedDescription)
            } else {
                self?.performSegue(withIdentifier: PropertyKeys.loginPasswordSegue, sender: nil)
            }
        }
        
       // performSegue(withIdentifier: PropertyKeys.loginPasswordSegue, sender: nil)
    }
    
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        guard let login = loginTextField.text,
              let password = passwordTextField.text else { return }
        Auth.auth().createUser(withEmail: login, password: password) { [weak self] authResult, error in
            if let error = error {
                self?.showLoginAlert(message: error.localizedDescription)
            } else {
                self?.performSegue(withIdentifier: PropertyKeys.loginPasswordSegue, sender: nil)
            }
        }
    }
    
   
    
}
