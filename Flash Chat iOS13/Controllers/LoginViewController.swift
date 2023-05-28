//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Ilyas Tyumenev on 27.05.2023.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!

    @IBAction func loginPressed(_ sender: UIButton) {
        
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
                if let err = error {
                    print(err.localizedDescription)
                } else {
                    self.performSegue(withIdentifier: "LoginToChat", sender: self)
                }
            }
        }
    }    
}
