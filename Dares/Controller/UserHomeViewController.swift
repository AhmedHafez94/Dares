//
//  UserHomeViewController.swift
//  Dares
//
//  Created by Mohamed Hafez on 5/12/21.
//

import UIKit
import PhoneNumberKit
import FlagPhoneNumber
import CountryPickerView

class UserHomeViewController: UIViewController, FPNTextFieldDelegate {
    var name: String?
    @IBOutlet weak var numberTextField: UITextField!
    private var listController: FPNCountryListViewController = FPNCountryListViewController(style: .grouped)
    

    @IBOutlet weak var firstNumber: FPNTextField!
    @IBOutlet weak var secondNumber: PhoneNumberTextField!
    @IBOutlet weak var nameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let cpv = CountryPickerView(frame: CGRect(x: 0, y: 0, width: 120, height: 20))
        cpv.setCountryByCode("+996")
        cpv.flagImageView.image = .none
        numberTextField.leftView = cpv
        numberTextField.leftViewMode = .always
        numberTextField.semanticContentAttribute = .forceRightToLeft
        firstNumber.delegate = self
        secondNumber.delegate = self
        firstNumber.flagButton.imageView?.image = .none
        
        self.addDoneButtonOnKeyboard()
        firstNumber.semanticContentAttribute = .forceRightToLeft
        listController.setup(repository: firstNumber.countryRepository)
        listController.didSelect = { [weak self] country in
            self?.firstNumber.setFlag(countryCode: country.code)}
        
        firstNumber.setFlag(key: .SA)
        firstNumber.displayMode = .list
        firstNumber.placeholder = "ادخل الرقم١"
        firstNumber.returnKeyType = .done
        secondNumber.withPrefix = true
        secondNumber.withExamplePlaceholder = true
        secondNumber.withFlag = true
        secondNumber.placeholder = "ادخل الرقم٢"
        secondNumber.semanticContentAttribute = .forceRightToLeft
//        secondNumber.returnKeyType = .done
        
        
        
        nameLabel.text = name
    }
    
    func fpnDisplayCountryList() {
          let navigationViewController = UINavigationController(rootViewController: listController)
          
          present(navigationViewController, animated: true, completion: nil)
       }

       /// Lets you know when a country is selected
       func fpnDidSelectCountry(name: String, dialCode: String, code: String) {
          print(name, dialCode, code) // Output "France", "+33", "FR"
       }

       /// Lets you know when the phone number is valid or not. Once a phone number is valid, you can get it in severals formats (E164, International, National, RFC3966)
       func fpnDidValidatePhoneNumber(textField: FPNTextField, isValid: Bool) {
          if isValid {
             // Do something...
             textField.getFormattedPhoneNumber(format: .E164)       // Output "+33600000001"
             textField.getFormattedPhoneNumber(format: .International)  // Output "+33 6 00 00 00 01"
             textField.getFormattedPhoneNumber(format: .National)       // Output "06 00 00 00 01"
             textField.getFormattedPhoneNumber(format: .RFC3966)     // Output "tel:+33-6-00-00-00-01"
             textField.getRawPhoneNumber()                               // Output "600000001"
          } else {
             // Do something...
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
        
        self.firstNumber.inputAccessoryView = doneToolbar
        
      }
      
    @objc func doneButtonAction()
      {
        self.firstNumber.resignFirstResponder()
      }
    

}

