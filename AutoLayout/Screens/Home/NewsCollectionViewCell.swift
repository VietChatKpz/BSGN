//
//  NewsCollectionViewCell.swift
//  AutoLayout
//
//  Created by Nguyễn Đình Việt on 16/05/2022.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {

//    var shadows = UIView()
    @IBOutlet weak var newsView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

//        shadows.frame = newsView.frame
//        shadows.clipsToBounds = false
//        newsView.addSubview(shadows)
//        
//        newsView.layer.shadowRadius = 20
//        newsView.layer.shadowOffset = CGSize(width: 0, height: 4)
//        newsView.layer.shadowOpacity = 1
//        newsView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
//        newsView.layer.shadowPath = UIBezierPath(roundedRect: shadows.bounds, cornerRadius: 8).cgPath

        
    }

}
