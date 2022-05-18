//
//  LoginViewController.swift
//  AutoLayout
//
//  Created by Nguyễn Đình Việt on 16/05/2022.
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
        let input = phoneTextField.text!
        let index = input.index(input.startIndex, offsetBy: 0)
        
        if (String(input[index]) == "0" && phoneTextField.text?.count == 10) || (String(input[index]) != "0" && phoneTextField.text?.count == 9) {
            let otpVC = OTPViewController()
            otpVC.modalPresentationStyle = .fullScreen
            present(otpVC, animated: true)
            
            otpVC.text = phoneTextField?.text ?? ""
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
        
    func textFieldDidChangeSelection(_ textField: UITextField) {        
        if phoneTextField.text == "" {
            viewPhone?.layer.borderColor = UIColor(red: 0.93, green: 0.94, blue: 0.96, alpha: 1.00).cgColor
            nextButton.backgroundColor = UIColor(red: 0.17, green: 0.53, blue: 0.40, alpha: 0.3)
        }else{
            viewPhone.layer.borderColor = UIColor(red: 0.17, green: 0.53, blue: 0.40, alpha: 1.00).cgColor
        }
        
        if phoneTextField.text?.count == 10 || phoneTextField.text?.count == 9 {
            nextButton.backgroundColor = UIColor(red: 0.17, green: 0.53, blue: 0.40, alpha: 1.00)
        }else {
            nextButton.backgroundColor = UIColor(red: 0.17, green: 0.53, blue: 0.40, alpha: 0.3)
        }
    }
}
