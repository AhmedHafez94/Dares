//
//  SignUpViewController.swift
//  Dares
//
//  Created by Mohamed Hafez on 5/6/21.
//

import UIKit
import JVFloatLabeledTextField

class SignUpViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var reEnterPasswordTextField: JVFloatLabeledTextField!
    @IBOutlet weak var passwordTextField: JVFloatLabeledTextField!
    @IBOutlet weak var emailTextField: JVFloatLabeledTextField!
    @IBOutlet weak var fullNameTextField: JVFloatLabeledTextField!
    @IBOutlet weak var phoneNumTextField: JVFloatLabeledTextField!
    @IBOutlet weak var phoneNumberStackView: UIStackView!
    @IBOutlet weak var reEntrPasswordStackView: UIStackView!
    @IBOutlet weak var passwordStaackView: UIStackView!
    @IBOutlet weak var emailStackView: UIStackView!
    @IBOutlet weak var fullNameStackView: UIStackView!
    @IBOutlet weak var signUpButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.delegate = self
        emailTextField.delegate = self
        phoneNumTextField.delegate = self
        passwordTextField.delegate = self
        reEnterPasswordTextField.delegate = self
        
        reEntrPasswordStackView.roundCorners(radius: 12)
        passwordStaackView.roundCorners(radius: 12)
        emailStackView.roundCorners(radius: 12)
        fullNameStackView.roundCorners(radius: 12)
        phoneNumberStackView.roundCorners(radius: 12)
        signUpButton.roundCorners(radius: 12)
               
    }
    

    
    @IBAction func backButtonPressed2(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true 
    }
    
}
