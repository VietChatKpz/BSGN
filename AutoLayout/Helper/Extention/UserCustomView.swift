//
//  CustomView.swift
//  AutoLayout
//
//  Created by Nguyễn Đình Việt on 15/06/2022.
//

import UIKit

class UserCustomView: UIView {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var view: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()

    }
    
    func commonInit(){
        let viewFromXib = Bundle.main.loadNibNamed("UserCustomView", owner: self, options: nil)![0] as! UIView
        viewFromXib.frame = self.bounds
        addSubview(viewFromXib)
        textField.delegate = self
    }
}
extension UserCustomView: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        nameLabel.textColor = UIColor(red: 0.17, green: 0.53, blue: 0.40, alpha: 1.00)
        view.backgroundColor = UIColor(red: 0.17, green: 0.53, blue: 0.40, alpha: 1.00)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        nameLabel.textColor = UIColor(red: 0.59, green: 0.61, blue: 0.67, alpha: 1.00)
        view.backgroundColor = UIColor(red: 0.90, green: 0.90, blue: 0.90, alpha: 1.00)
    }
}
