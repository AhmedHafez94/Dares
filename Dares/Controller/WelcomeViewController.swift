//
//  ViewController.swift
//  Dares
//
//  Created by Ahmed Hafez on 5/6/21.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var noAccountButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        noAccountButton.roundCorners(radius: 12)
        loginButton.roundCorners(radius: 12)
        noAccountButton.layer.borderWidth = 1.0
        noAccountButton.layer.borderColor = UIColor.gray.cgColor
        
    }
    


}

