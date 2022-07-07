//
//  LoginViewController.swift
//  sNet
//
//  Created by Юрий Гриневич on 30.04.2022.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    let login: [LoginProtocol] = []
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loginTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginTextField.text = "test@gmail.com"
        
        self.setupHideKeyboardOnTap()
        scrollView.registerForKeyboardNotifications()
    }
    
    
    
    
    @IBAction func enterButtonPressed(_ sender: UIButton) {
        guard let login = loginTextField.text,
              login != "" else {return showLoginAlert(message: "Login is empty")}
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondLoginViewController = storyboard.instantiateViewController(withIdentifier:
                                                                PropertyKeys.secondLoginViewController) as! SecondLoginViewController
        // передаем данные
        secondLoginViewController.updatingData = loginTextField.text ?? ""
        // переходим к следующему экрану
        self.navigationController?.pushViewController(secondLoginViewController, animated: true)
        
        //   performSegue(withIdentifier: PropertyKeys.loginSegue, sender: nil)
        
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
