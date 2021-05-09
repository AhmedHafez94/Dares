//
//  FormField.swift
//  Dares
//
//  Created by Mohamed Hafez on 5/8/21.
//

import UIKit
import JVFloatLabeledTextField


@IBDesignable class FormField: UIView, UITextFieldDelegate {
    
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var inputField: JVFloatLabeledTextField!
    
    @IBInspectable var placeholder: String = "" {
        didSet {
            inputField.placeholder = placeholder
        }
    }
    @IBInspectable var secureField: Bool = false {
        didSet {
            inputField.isSecureTextEntry = secureField
        }
    }
    @IBInspectable var image: UIImage? {
        didSet {
            iconView.image = image
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    
    func commonInit() {
       let view = loadViewFromNib(nibName: "FormField")
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        view.translatesAutoresizingMaskIntoConstraints = true
        
        view.frame = self.bounds
        view.roundCorners(radius: 12)
        inputField.delegate = self 
        addSubview(view)
    }
    
    func loadViewFromNib(nibName: String) -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        
        return view
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
