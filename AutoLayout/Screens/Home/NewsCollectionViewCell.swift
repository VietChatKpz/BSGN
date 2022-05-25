//
//  NewsCollectionViewCell.swift
//  AutoLayout
//
//  Created by Nguyễn Đình Việt on 16/05/2022.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var newImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//
//    }
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

}
