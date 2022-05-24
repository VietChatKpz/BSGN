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
