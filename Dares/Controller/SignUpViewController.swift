//
//  SignUpViewController.swift
//  Dares
//
//  Created by Mohamed Hafez on 5/6/21.
//

import UIKit

class SignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("navigationController")

        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func backButtonPressed2(_ sender: UIButton) {
        print(navigationController)
        navigationController?.popViewController(animated: true)
        print("hello")
    }
    
}
