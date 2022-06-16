//
//  ExtentionOTPTextField.swift
//  AutoLayout
//
//  Created by Nguyễn Đình Việt on 24/05/2022.
//

import Foundation
import UIKit

class OTPTextField: UITextField {
    
    weak var previousTextField: OTPTextField?
    weak var nextTextField: OTPTextField?
    
    override public func deleteBackward(){
        text = ""
        previousTextField?.becomeFirstResponder()
    }
    
}
class ConvertHelper {
    static func stringFromDate(date: Date, format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        let string = formatter.string(from: date)
        return string
    }
}

class GlobalData {
    
    // chỉ dùng trong màn Login, verify OTP, step 1
    var localPhone: PhoneNumberModel = PhoneNumberModel()
    
    static let shared = GlobalData()
 
}
