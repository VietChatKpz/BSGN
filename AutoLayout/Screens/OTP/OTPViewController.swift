//
//  OTPViewController.swift
//  AutoLayout
//
//  Created by Nguyễn Đình Việt on 16/05/2022.
//

import UIKit

class OTPViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var otp1TextField: UITextField!
    @IBOutlet weak var otp2TextField: UITextField!
    @IBOutlet weak var otp3TextField: UITextField!
    @IBOutlet weak var otp4TextField: UITextField!
    @IBOutlet weak var otp5TextField: UITextField!
    @IBOutlet weak var otp6TextField: UITextField!
    @IBOutlet weak var maButton: UIButton!
    @IBOutlet weak var falseLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var resetLabel: UILabel!
    
    var text = String()
    var second: Int = 60
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        maButton.layer.borderWidth = 1.0
        maButton.layer.borderColor = UIColor(red: 0.85, green: 0.86, blue: 0.88, alpha: 1.00).cgColor
        falseLabel.isHidden = true
        
        otp1TextField.addTarget(self, action: #selector(self.textdidChange(textfield:)), for: UIControl.Event.editingChanged)
        otp2TextField.addTarget(self, action: #selector(self.textdidChange(textfield:)), for: UIControl.Event.editingChanged)
        otp3TextField.addTarget(self, action: #selector(self.textdidChange(textfield:)), for: UIControl.Event.editingChanged)
        otp4TextField.addTarget(self, action: #selector(self.textdidChange(textfield:)), for: UIControl.Event.editingChanged)
        otp5TextField.addTarget(self, action: #selector(self.textdidChange(textfield:)), for: UIControl.Event.editingChanged)
        otp6TextField.addTarget(self, action: #selector(self.textdidChange(textfield:)), for: UIControl.Event.editingChanged)
        
        otp1TextField.delegate = self
    }
    
    func createTime() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
    }
    
    @objc func fireTimer() {
        
        second = second - 1
        resetLabel.text = "Gửi lại sau " + "\(second)s"
        if second == 0 {
            timer.invalidate()
            resetLabel.text = "Gửi lại"
            resetLabel.textColor = UIColor(red: 0.17, green: 0.53, blue: 0.40, alpha: 1.00)
            maButton.layer.borderColor = UIColor(red: 0.17, green: 0.53, blue: 0.40, alpha: 1.00).cgColor
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        otp1TextField.becomeFirstResponder()
        phoneLabel.text = "Vui lòng nhập mã gồm 4 chữ số đã được gửi đến bạn vào số điện thoại" + " " + "+84" + " " + "\(text)"
        createTime()
    }
    
    @objc func textdidChange(textfield: UITextField){
        let text = textfield.text
        
        if text?.utf16.count == 1 {
            switch textfield {
            case otp1TextField:
                otp2TextField.becomeFirstResponder()
                break
            case otp2TextField:
                otp3TextField.becomeFirstResponder()
                break
            case otp3TextField:
                otp4TextField.becomeFirstResponder()
                break
            case otp4TextField:
                otp5TextField.becomeFirstResponder()
                break
            case otp5TextField:
                otp6TextField.becomeFirstResponder()
                break
            case otp6TextField:
                otp6TextField.becomeFirstResponder()
                break
                
            default:
                break
            }
        }else {
            
        }
    }
    @IBAction func secondButton(_ sender: Any) {
        if resetLabel.text == "Gửi lại" {
            createTime()
            second = 60
            resetLabel.textColor = UIColor(red: 0.85, green: 0.86, blue: 0.88, alpha: 1.00)
            maButton.layer.borderColor = UIColor(red: 0.85, green: 0.86, blue: 0.88, alpha: 1.00).cgColor
            otp1TextField.becomeFirstResponder()
            falseLabel.isHidden = true
            otp1TextField.text = ""
            otp2TextField.text = ""
            otp3TextField.text = ""
            otp4TextField.text = ""
            otp5TextField.text = ""
            otp6TextField.text = ""
        }
    }
    
    @IBAction func backAction(_ sender: Any) {
        dismiss(animated: true)
    }
    @IBAction func nextAction(_ sender: Any) {
        guard let otp1 = otp1TextField.text, let otp2 = otp2TextField.text, let otp3 = otp3TextField.text, let otp4 = otp4TextField.text, let otp5 = otp5TextField.text, let otp6 = otp6TextField.text, !otp1.isEmpty, !otp2.isEmpty, !otp3.isEmpty, !otp4.isEmpty, !otp5.isEmpty, !otp6.isEmpty else {
            return
        }
        if otp1 == "1", otp2 == "1", otp3 == "1", otp4 == "1", otp5 == "1", otp6 == "1" {
            falseLabel.isHidden = true
            let vc = HomeViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        }else{
            falseLabel.isHidden = false
        }
    }
    
}

