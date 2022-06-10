//
//  NewsCollectionViewCell.swift
//  AutoLayout
//
//  Created by Nguyễn Đình Việt on 16/05/2022.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var newsView: UIView!
    @IBOutlet weak var newImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    func configViews(news: PatientNewModel?) {
        let imageURL = news?.picture
        let title = news?.title
        let name = news?.category_name
        let date = news?.created_at
        
        configViews(imageURLStr: imageURL, title: title, name: name, date: date)
    }
    
    //B1:
    private func configViews(imageURLStr: String?, title: String?, name: String?, date: String?){
        Ultilities.loadImage(newImage, strURL: imageURLStr ?? "", placeHolder: nil)
        titleLabel.text = title ?? ""
        nameLabel.text = name ?? ""
        dateLabel.text = date ?? ""

    }
    
    func setUpNew() {
        newsView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        newsView.layer.shadowOpacity = 1
        newsView.layer.shadowRadius = 20
        newsView.layer.shadowOffset = CGSize(width: 0, height: 4)
        newsView.layer.borderColor = UIColor(red: 0.93, green: 0.94, blue: 0.96, alpha: 1.00).cgColor
        newsView.layer.borderWidth = 1
    }

}
