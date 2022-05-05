//
//  SecondLoginViewController.swift
//  sNet
//
//  Created by Юрий Гриневич on 04.05.2022.
//

import UIKit

class SecondLoginViewController: UIViewController {
    
    let login: [LoginProtocol] = []
    
    var updatingData: String = ""
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordTextField.setRightButton(systemName: "eye.fill")
        self.setupHideKeyboardOnTap()
        scrollView.registerForKeyboardNotifications()
        updateLoginTextField(with: updatingData)
    }
    
    func updateLoginTextField(with text: String) {
        loginTextField.text = text
    }

    
    @IBAction func enterButtonPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: PropertyKeys.loginPasswordSegue, sender: nil)
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
