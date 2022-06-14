//
//  OTPViewController.swift
//  AutoLayout
//
//  Created by Nguyễn Đình Việt on 16/05/2022.
//

import UIKit

class OTPViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var otpContainerView: UIView!
    @IBOutlet weak var maButton: UIButton!
    @IBOutlet weak var falseLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var resetLabel: UILabel!
    @IBOutlet weak var otpView: UIView!
    @IBOutlet weak var bottomView: UIView!
    
    var text = String()
    var second: Int = 60
    var timer = Timer()
    
    
    let otpStackView = OTPStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        Utility.logAllAvailableFonts()
//        self.hideKeyBoard()
        
        maButton.layer.borderWidth = 1.0
        maButton.layer.borderColor = UIColor(red: 0.85, green: 0.86, blue: 0.88, alpha: 1.00).cgColor
        falseLabel.isHidden = true
        
        otpContainerView.addSubview(otpStackView)
        otpStackView.delegate = self
        otpStackView.topAnchor.constraint(equalTo: otpContainerView.topAnchor).isActive = true
        otpStackView.leftAnchor.constraint(equalTo: otpContainerView.leftAnchor).isActive = true
        otpStackView.rightAnchor.constraint(equalTo: otpContainerView.rightAnchor).isActive = true
        otpStackView.bottomAnchor.constraint(equalTo: otpContainerView.bottomAnchor).isActive = true
                
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
        registerObserver()
        phoneLabel.text = "Vui lòng nhập mã gồm 4 chữ số đã được gửi đến bạn vào số điện thoại" + " " + "+84" + " " + "\(text)"
        createTime()
    }
    private func registerObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        
        let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue ?? .zero
        let duration = (notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double) ?? 0
        
        UIView.animate(withDuration: duration) {[weak self] in
            guard let self = self else { return}
            
            self.nextButton.transform = CGAffineTransform(translationX: 0, y: -keyboardSize.height + self.safeAreaInsets.bottom)
        }
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        let duration = (notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double) ?? 0
        
        UIView.animate(withDuration: duration) {[weak self] in
            guard let self = self else { return}
            
            self.nextButton.transform = .identity
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @IBAction func secondButton(_ sender: Any) {
        //if resetLabel.text == "Gửi lại" {
        if second == 0 {
            createTime()
            second = 60
            resetLabel.textColor = UIColor(red: 0.85, green: 0.86, blue: 0.88, alpha: 1.00)
            maButton.layer.borderColor = UIColor(red: 0.85, green: 0.86, blue: 0.88, alpha: 1.00).cgColor
            falseLabel.isHidden = true
        }
    }
    
    @IBAction func backAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func nextAction(_ sender: Any) {
        //        print("Final OTP : ",otpStackView.getOTP())
        if otpStackView.getOTP() == "111111" {
            falseLabel.isHidden = true
            let vc = HomeViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
        else {
            falseLabel.isHidden = false
        }
    }
}

extension OTPViewController: OTPDelegate {
    
    func didChangeValidity() {
        nextButton.backgroundColor = UIColor(red: 0.17, green: 0.53, blue: 0.40, alpha: 1.00)
    }
}
