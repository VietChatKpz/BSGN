//
//  PromoTableViewCell.swift
//  AutoLayout
//
//  Created by Nguyễn Đình Việt on 26/05/2022.
//

import UIKit

class PromoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var promoImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabe: UILabel!
    @IBOutlet weak var checkImage: UIImageView!
    
    
    var checkAction: (() -> Void)?
    var truyenFoodName: ((String) -> Void)?

    var promo: Promo?{
        didSet{
            if let promo = promo{
                // if else rut gon
                checkImage.image = UIImage(named: promo.isSelected ? "checked" : "unchecked")
            }
        }
    }


    @objc func tapAction(){
        checkAction?()
        
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        checkImage.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        checkImage.addGestureRecognizer(tapGesture)
        promoImage.layer.borderWidth = 1.0
        promoImage.layer.borderColor = UIColor(red: 0.93, green: 0.94, blue: 0.96, alpha: 1.00).cgColor
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    func configPromo(promo: promoAPI?) {
        let imageURL = promo?.picture
        let title = promo?.name
        let date = promo?.created_at
        
        configPromo(imageURLStr: imageURL, title: title, date: date)
    }
    private func configPromo(imageURLStr: String?, title: String?, date: String?){
        Ultilities.loadImage(promoImage, strURL: imageURLStr ?? "", placeHolder: nil)
        titleLabel.text = title ?? ""
        dateLabe.text = date ?? ""
    }
    
    @IBAction func clickOnPress(_ sender: Any) {
        
    }
}
