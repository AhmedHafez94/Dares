//
//  experimentViewController.swift
//  Dares
//
//  Created by Mohamed Hafez on 5/16/21.
//

import UIKit
import CountryPickerView

class experimentViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var countryView: CountryPickerView!
    
    @IBOutlet weak var numberField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        numberField.delegate = self
        countryView.flagImageView.image = UIImage(systemName: "arrowtriangle.down.fill")
        countryView.flagImageView.tintColor = .purple
//        countryView.flagImageView.backgroundColor = .brown
        countryView.showCountryCodeInView = false
        countryView.setCountryByName("Saudi Arabia")
        addDoneButtonOnKeyboard()
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
