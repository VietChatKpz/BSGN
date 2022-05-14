//
//  LoginViewController.swift
//  AutoLayout
//
//  Created by Nguyễn Đình Việt on 13/05/2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var viewPhone: UIView!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        phoneTextField.keyboardType = .numberPad
        viewPhone?.layer.borderWidth = 1.0
        viewPhone?.layer.borderColor = UIColor(red: 0.93, green: 0.94, blue: 0.96, alpha: 1.00).cgColor
        phoneTextField.delegate = self
                  
    }
    @IBAction func backAction(_ sender: Any) {
        dismiss(animated: true)
    }
    @IBAction func nextAction(_ sender: Any) {
        DispatchQueue.main.async {
            if self.phoneTextField.text != "" {
                self.nextButton.backgroundColor = UIColor(red: 0.17, green: 0.53, blue: 0.40, alpha: 1.00)
                self.viewPhone.layer.borderColor = UIColor(red: 0.17, green: 0.53, blue: 0.40, alpha: 1.00).cgColor
                self.viewPhone.layer.borderWidth = 1.0
            }
            else {
                self.nextButton.backgroundColor = UIColor(red: 0.17, green: 0.53, blue: 0.40, alpha: 0.3)

            }

        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        phoneTextField.resignFirstResponder()
        if phoneTextField.text != nil{
            nextButton.backgroundColor = UIColor(red: 0.17, green: 0.53, blue: 0.40, alpha: 1.00)
        }else {
            nextButton.backgroundColor = UIColor(red: 0.17, green: 0.53, blue: 0.40, alpha: 0.3)
        }
        return true
    }
}
