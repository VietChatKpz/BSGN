//
//  LoginCollectionViewCell.swift
//  AutoLayout
//
//  Created by Nguyễn Đình Việt on 13/05/2022.
//

import UIKit

class LoginCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setUp(with login: Login){
        logoImageView.image = UIImage(named: login.image)
        label1.text = login.label1
        label2.text = login.label2
    }

}
