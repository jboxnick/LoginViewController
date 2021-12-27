//
//  LoginViewController.swift
//  LoginViewController
//
//  Created by Julian on 27.12.21.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    //MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Actions
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        
        //Disable the loginButton to prevent double tapping
        
        loginButton.isUserInteractionEnabled = false
        
        //Hide keyboard for each textField
        
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        
        //Check textFields for information, cancel function when there's no information, and enable loginButton again
        
        guard let email = emailTextField.text, let password = passwordTextField.text, !email.isEmpty, !password.isEmpty else {
            loginButton.isUserInteractionEnabled = true
            return
        }
        
        //Login to Firebase
        
        loginToFirebase(_email: email, _password: password)
    }
    
    //MARK: - Helper Functions
    
    func loginToFirebase(_email: String, _password: String) {
        
        Auth.auth().signIn(withEmail: _email, password: _password) { (result, error) in
            if let err = error {
                print(err)
                self.loginButton.isUserInteractionEnabled = true
                return
            } else {
                print("User with UID: \(result!.user.uid) logged in successfully")
                self.loginButton.isUserInteractionEnabled = true
                
                self.emailTextField.text = ""
                self.passwordTextField.text = ""
                self.performSegue(withIdentifier: "segueToMain", sender: self)
            }
        }
    }
    
    //MARK: - Navigation
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    deinit {
        print("VC deinitialized: \(self)")
    }
}
