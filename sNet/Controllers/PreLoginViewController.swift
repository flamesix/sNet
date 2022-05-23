//
//  PreLoginViewController.swift
//  sNet
//
//  Created by Юрий Гриневич on 21.05.2022.
//

import UIKit

class PreLoginViewController: UIViewController {
    
    @IBOutlet weak var logoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logoLabel.text = ""
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        var characterIndex = 0.0
        let logoText = "Grinevich Apps"
        
        
        for letter in logoText {
            Timer.scheduledTimer(withTimeInterval: 0.1 * characterIndex, repeats: false) { timer in
                self.logoLabel.text?.append(letter)
            }
            characterIndex += 1
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.performSegue(withIdentifier: PropertyKeys.preLoginToLoginSegue, sender: nil)
        }
        
        
        
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
