//
//  SignUpViewController.swift
//  Dares
//
//  Created by Mohamed Hafez on 5/6/21.
//

import UIKit
import JVFloatLabeledTextField

class SignUpViewController: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        signUpButton.roundCorners(radius: 12)
    }
    

    
    @IBAction func backButtonPressed2(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    
}
