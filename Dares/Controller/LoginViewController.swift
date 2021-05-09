//
//  LoginViewController.swift
//  Dares
//
//  Created by Ahmed Hafez on 5/6/21.
//

import UIKit

class LoginViewController: UIViewController {
   
   
    @IBOutlet weak var loginButton: UIButton!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.roundCorners(radius: 12)
         
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
