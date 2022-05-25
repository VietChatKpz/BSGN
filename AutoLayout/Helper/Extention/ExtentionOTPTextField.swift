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
