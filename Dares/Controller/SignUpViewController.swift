//
//  SignUpViewController.swift
//  Dares
//
//  Created by Mohamed Hafez on 5/6/21.
//

import UIKit
import Firebase
import CountryPickerView

class SignUpViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var phoneView: UIStackView!
    
    @IBOutlet weak var numberField: UITextField!
    @IBOutlet weak var countryView: CountryPickerView!
    @IBOutlet weak var nameView: FormField!
    @IBOutlet weak var passwordView: FormField!
    @IBOutlet weak var emailView: FormField!
    @IBOutlet weak var signUpButton: LoadingButton!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        signUpButton.roundCorners(radius: 12)
        phoneView.roundCorners(radius: 12)
        numberField.delegate = self
        countryView.flagImageView.image = UIImage(systemName: "arrowtriangle.down.fill")
        countryView.flagImageView.tintColor = signUpButton.backgroundColor
        countryView.textColor = .lightGray
        //        countryView.flagImageView.backgroundColor = .brown
        countryView.showCountryCodeInView = false
        countryView.setCountryByName("Saudi Arabia")
        addDoneButtonOnKeyboard()
    }
    

    
    @IBAction func backButtonPressed2(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signUpPressed(_ sender: Any) {
        signUpButton.showLoading()
        if let email = emailView.inputField.text, let password = passwordView.inputField.text, let name = nameView.inputField.text {
            Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
                guard let strongSelf = self else {
                    print("some thing went wrong in sign up view")
                    return
                }
                if let e = error {
                    print(e.localizedDescription)
                    
                }
                else {
                    print("email created")
                    print(authResult?.user.email)
                    let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                    changeRequest?.displayName = name
                
                    changeRequest?.commitChanges { (error) in
                        print("error in commit changes closures")
                        print(error?.localizedDescription)
                    }

                }
            }
            
        }
        
    }
    func addDoneButtonOnKeyboard()
      {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        doneToolbar.barStyle = UIBarStyle.default
        doneToolbar.backgroundColor = .white
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "return", style: UIBarButtonItem.Style.done, target: self, action: #selector(UserHomeViewController.doneButtonAction))
        done.tintColor = .black
        
        var items = [UIBarButtonItem]()
        items.append(flexSpace)
        items.append(done)
        
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.numberField.inputAccessoryView = doneToolbar
        
      }
      
    @objc func doneButtonAction()
      {
        self.numberField.resignFirstResponder()
      }
    
    
    
}
