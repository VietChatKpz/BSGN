//
//  PromoCollectionViewCell.swift
//  AutoLayout
//
//  Created by Nguyễn Đình Việt on 16/05/2022.
//

import UIKit

class PromoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var promoView: UIView!
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
    
    func setUpPromo() {
        promoView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        promoView.layer.shadowOpacity = 1
        
        promoView.layer.shadowRadius = 20
        promoView.layer.shadowOffset = CGSize(width: 0, height: 4)
        promoView.layer.borderColor = UIColor(red: 0.93, green: 0.94, blue: 0.96, alpha: 1.00).cgColor
        promoView.layer.borderWidth = 1
    }    
}
