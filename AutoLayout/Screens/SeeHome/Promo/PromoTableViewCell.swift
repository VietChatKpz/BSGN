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
    @IBOutlet weak var clickButton: UIButton!
    
//    var checkAction: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
    }

//    @objc func tapAction(){
//        checkAction?()
//    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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
