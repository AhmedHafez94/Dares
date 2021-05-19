//
//  LoginViewController.swift
//  Dares
//
//  Created by Ahmed Hafez on 5/6/21.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    var xName: String = ""
   
    @IBOutlet weak var passwordView: FormField!
    @IBOutlet weak var emailView: FormField!
    
    @IBOutlet weak var loginButton: UIButton!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.roundCorners(radius: 12)
         
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        let email = emailView.inputField.text ?? ""
        let password = passwordView.inputField.text ?? ""
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
          guard let strongSelf = self else { return }
            if let e = error {
                print(e.localizedDescription)
            } else {
                print("signed in correctly")
                print(authResult?.user.displayName)
                self?.xName = authResult?.user.displayName ?? "No name"
                self?.performSegue(withIdentifier: "userHome", sender: self)
                
            }
        }
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let destinationVC = segue.destination as! UserHomeViewController
//        destinationVC.name = xName
//    }
}
