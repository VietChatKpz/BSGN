//
//  PromoCollectionViewCell.swift
//  AutoLayout
//
//  Created by Nguyễn Đình Việt on 16/05/2022.
//

import UIKit

class PromoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var promoImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }

    func configViews(promos: PatientPromoModel?) {
        let imageURL = promos?.picture
        let title = promos?.name
        let name = promos?.category_name
        let date = promos?.created_at

        configViews(imageURLStr: imageURL, title: title, name: name, date: date)
    }
    
    //B1:
    private func configViews(imageURLStr: String?, title: String?, name: String?, date: String?){
        Ultilities.loadImage(promoImage, strURL: imageURLStr ?? "", placeHolder: nil)
        titleLabel.text = title ?? ""
        nameLabel.text = name ?? ""
        dateLabel.text = date ?? ""
    }
    
}
