//
//  MainViewController.swift
//  LoginViewController
//
//  Created by Julian on 27.12.21.
//

import UIKit
import FirebaseAuth

class MainViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var textLabel: UILabel!
    
    //MARK: - Properties
    
    
    //MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let currentUser = Auth.auth().currentUser {
            textLabel.text = "User with UID: \(currentUser.uid) logged in!"
        }
    }
    
    //MARK: - Actions
    
    @IBAction func logoutButtonTapped(_ sender: UIButton) {
        
        //Logout from Firebase
        
        logoutFromFirebase()
    }
    
    
    //MARK: - Helper Functions
    
    func logoutFromFirebase() {
        
        do {
            try Auth.auth().signOut()
            print("User successfully signed out!")
            self.dismiss(animated: true, completion: nil)
        } catch {
            print("Error on user logout!")
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

