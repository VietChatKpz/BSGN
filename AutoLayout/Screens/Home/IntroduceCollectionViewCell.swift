//
//  IntroduceCollectionViewCell.swift
//  AutoLayout
//
//  Created by Nguyễn Đình Việt on 16/05/2022.
//

import UIKit

class IntroduceCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var introView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        introView.layer.borderWidth = 1.0
        introView.layer.borderColor = UIColor(red: 0.93, green: 0.94, blue: 0.96, alpha: 1.00).cgColor
    }

}
