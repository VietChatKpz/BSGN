//
//  Extention.swift
//  AutoLayout
//
//  Created by Nguyễn Đình Việt on 18/05/2022.
//

import Foundation
import UIKit

extension UIViewController {
    func hideKeyBoard(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyBoard))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyBoard() {
        self.view.endEditing(true)
    }
}

//extension UIViewController: UITextFieldDelegate {
//    public func textFieldDidChangeSelection(_ textField: UITextField) {
//        func textFieldDidChangeSelection(_ textField: UITextField) {
//            if textField.text == "" {
//                view?.layer.borderColor = UIColor(red: 0.93, green: 0.94, blue: 0.96, alpha: 1.00).cgColor
//            }
//        }
//    }
//}

extension NSMutableAttributedString {
    
    func attrStr(text: String,
                 font: UIFont? = nil,
                 textColor: UIColor? = nil,
                 alignment: NSTextAlignment? = nil) -> NSMutableAttributedString {
        var attributes: [NSAttributedString.Key: Any] = [:]
        
        if let font = font {
            attributes[.font] = font
        }
        if let textColor = textColor {
            attributes[.foregroundColor] = textColor
        }
        
        if let alignment = alignment {
            let paragraph = NSMutableParagraphStyle()
            paragraph.alignment = alignment
            
            attributes[.paragraphStyle] = paragraph
        }
        
        let string = NSMutableAttributedString(string: text, attributes: attributes)
        self.append(string)
        return self
    }
}


