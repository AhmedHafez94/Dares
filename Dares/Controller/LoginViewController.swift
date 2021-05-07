//
//  LoginViewController.swift
//  Dares
//
//  Created by Ahmed Hafez on 5/6/21.
//

import UIKit
import JVFloatLabeledTextField

class LoginViewController: UIViewController, UITextFieldDelegate {
   
    @IBOutlet weak var passwordTextField: JVFloatLabeledTextField!
    @IBOutlet weak var emailTextField: JVFloatLabeledTextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailStackView: UIStackView!
    
    @IBOutlet weak var passwordStackView: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.roundCorners(radius: 12)
        emailStackView.roundCorners(radius: 12)
        passwordStackView.roundCorners(radius: 12)
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
    }
    
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    

}
