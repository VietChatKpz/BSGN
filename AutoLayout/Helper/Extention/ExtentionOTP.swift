//
//  ExtentionOTP.swift
//  AutoLayout
//
//  Created by Nguyễn Đình Việt on 24/05/2022.
//

import Foundation
import UIKit

protocol OTPDelegate: class {
    //Luôn kích hoạt khi trường OTP hợp lệ
//    func didChangeValidity(isValid: Bool)
    func didChangeValidity()
}


class OTPStackView: UIStackView {
    
//    var textFieldArray = [OTPTextField]()
    //Customise the OTPField here
    let numberOfFields = 6
    var textFieldsCollection: [OTPTextField] = []
    weak var delegate: OTPDelegate?
    var showsWarningColor = false
    
    //Colors
    let inactiveFieldBorderColor = UIColor(red: 0.85, green: 0.86, blue: 0.88, alpha: 1.00)
    let textBackgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
    let activeFieldBorderColor = UIColor(red: 0.17, green: 0.53, blue: 0.40, alpha: 1.00)
    var remainingStrStack: [String] = []
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupStackView()
        addOTPFields()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStackView()
        addOTPFields()
    }
    
    //Customisation and setting stackView
    private final func setupStackView() {
//        self.backgroundColor = .clear
        self.isUserInteractionEnabled = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.contentMode = .center
        self.distribution = .fillEqually
        self.spacing = 16
    }
    
    //Adding each OTPfield to stack view
    private final func addOTPFields() {
        for index in 0..<numberOfFields{
            let field = OTPTextField()
            setupTextField(field)
            textFieldsCollection.append(field)
            //Adding a marker to previous field
            index != 0 ? (field.previousTextField = textFieldsCollection[index-1]) : (field.previousTextField = nil)
            //Adding a marker to next field for the field at index-1
            index != 0 ? (textFieldsCollection[index-1].nextTextField = field) : ()
        }
        textFieldsCollection[0].becomeFirstResponder()
    }
    
    //Customisation and setting OTPTextFields
    private final func setupTextField(_ textField: OTPTextField){
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        self.addArrangedSubview(textField)
        textField.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        textField.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
//        textField.widthAnchor.constraint(equalToConstant: 36).isActive = true
        textField.backgroundColor = textBackgroundColor
        textField.textAlignment = .center
        textField.adjustsFontSizeToFitWidth = false
//        textField.font = UIFont(name: "Inter", size: 40)
        textField.font = UIFont(name: "NunitoSans-Bold", size: 20)
        textField.textColor = UIColor(red: 0.02, green: 0.05, blue: 0.13, alpha: 1.00)
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 2
        textField.layer.borderColor = inactiveFieldBorderColor.cgColor
        textField.keyboardType = .numberPad
        textField.autocorrectionType = .yes
        textField.textContentType = .oneTimeCode
    }
    
    //checks if all the OTPfields are filled
    private final func checkForValidity(){
        for fields in textFieldsCollection{
            if (fields.text?.trimmingCharacters(in: CharacterSet.whitespaces) == ""){
//                delegate?.didChangeValidity(isValid: false)
                delegate?.didChangeValidity()
                return
            }
        }
//        delegate?.didChangeValidity(isValid: true)
        delegate?.didChangeValidity()
    }
    
    //gives the OTP text
    final func getOTP() -> String {
        var OTP = ""
        for textField in textFieldsCollection{
            OTP += textField.text ?? ""
        }
        return OTP
    }

    //set isWarningColor true for using it as a warning color
    final func setAllFieldColor(isWarningColor: Bool = false, color: UIColor){
        for textField in textFieldsCollection{
            textField.layer.borderColor = color.cgColor
        }
        showsWarningColor = isWarningColor
    }
    
    //autofill textfield starting from first
    private final func autoFillTextField(with string: String) {
        remainingStrStack = string.reversed().compactMap{String($0)}
        for textField in textFieldsCollection {
            if let charToAdd = remainingStrStack.popLast() {
                textField.text = String(charToAdd)
            } else {
                break
            }
        }
        checkForValidity()
        remainingStrStack = []
    }
    
}

//MARK: - TextField Handling
extension OTPStackView: UITextFieldDelegate {
        
//    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
//
//        let shoudEdit = textFieldsCollection.first(where: { $0.text?.isEmpty == true}) ?? textField
//
//        if shoudEdit == textField {
//            textField.layer.borderColor = UIColor(red: 0.17, green: 0.53, blue: 0.40, alpha: 1.00).cgColor
//            return true
//        } else {
//            shoudEdit.becomeFirstResponder()
//            return false
//        }
//    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if showsWarningColor {
            setAllFieldColor(color: inactiveFieldBorderColor)
            showsWarningColor = false
        }
        textField.layer.borderColor = activeFieldBorderColor.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        checkForValidity()
        textField.layer.borderColor = inactiveFieldBorderColor.cgColor
    }
    
    //switches between OTPTextfields
    func textField(_ textField: UITextField, shouldChangeCharactersIn range:NSRange,
                   replacementString string: String) -> Bool {
        guard let textField = textField as? OTPTextField else { return true }
        if string.count > 1 {
            textField.resignFirstResponder()
            autoFillTextField(with: string)
            return false
        } else {
            if (range.length == 0 && string == "") {
                return false
            } else if (range.length == 0){
                if textField.nextTextField == nil {
                    textField.text? = string
                    textField.resignFirstResponder()
                }else{
                    textField.text? = string
                    textField.nextTextField?.becomeFirstResponder()
                }
                return false
            }
            return true
        }
    }
    
}
