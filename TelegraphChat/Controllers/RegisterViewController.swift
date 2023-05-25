//
//  RegisterViewController.swift
//  TelegraphChat
//
//  Created by Berat Ridvan Asilturk 23/05/2023.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    
        
        @IBAction func registerPressed(_ sender: UIButton) {
            
            if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                guard let strongSelf = self else { return }
                if let e = error {
                    print(e.localizedDescription)
                } else {
                    /// Else ise ChatViewController'a git komutu :
                    self!.performSegue(withIdentifier: "RegisterToChat", sender: self)
                }
            }
            ///firebase register butonu tetikleme kodu, Password authentication icin.
        }
    }
}
