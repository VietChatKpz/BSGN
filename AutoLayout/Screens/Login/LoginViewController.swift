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
        
        hideKeyBoard()
        phoneTextField.keyboardType = .numberPad
        phoneTextField.delegate = self
        
        viewPhone.layer.cornerRadius = 28
        viewPhone.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        viewPhone.layer.shadowOpacity = 1
        viewPhone.layer.shadowRadius = 20
        viewPhone.layer.shadowOffset = CGSize(width: 0, height: 4)
        viewPhone.layer.borderColor = UIColor(red: 0.93, green: 0.94, blue: 0.96, alpha: 1.00).cgColor
        viewPhone.layer.borderWidth = 1
        
    }
    
    @IBAction func backAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func nextAction(_ sender: Any) {
        let input = phoneTextField.text!
        let index = input.index(input.startIndex, offsetBy: 0)
        
        if (String(input[index]) == "0" && phoneTextField.text?.count == 10) || (String(input[index]) != "0" && phoneTextField.text?.count == 9) {
            let otpVC = OTPViewController()
            navigationController?.pushViewController(otpVC, animated: true)
            otpVC.text = phoneTextField?.text ?? ""
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        viewPhone.layer.borderColor =  UIColor(red: 0.17, green: 0.53, blue: 0.40, alpha: 1.00).cgColor
        
    }
    func textFieldDidChangeSelection(_ textField: UITextField) {
        var phoneNumber = (phoneTextField.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
        if (phoneNumber.first == "0" && phoneNumber.count == 10) || (phoneNumber.first != "0" && phoneNumber.count == 9) {
            
            nextButton.backgroundColor = UIColor(red: 0.17, green: 0.53, blue: 0.40, alpha: 1.00)
        }else {
            nextButton.backgroundColor = UIColor(red: 0.17, green: 0.53, blue: 0.40, alpha: 0.3)
        }
    }
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
            OperationQueue.main.addOperation({
                UIMenuController.shared.setMenuVisible(false, animated: false)
            })
            return super.canPerformAction(action, withSender: sender)
        }
    
}
