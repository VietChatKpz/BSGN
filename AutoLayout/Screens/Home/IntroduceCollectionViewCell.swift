//
//  IntroduceCollectionViewCell.swift
//  AutoLayout
//
//  Created by Nguyễn Đình Việt on 16/05/2022.
//

import UIKit

class IntroduceCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var introView: UIView!
    @IBOutlet weak var introImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var majorLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//
//        introView.layer.borderWidth = 1.0
//        introView.layer.borderColor = UIColor(red: 0.93, green: 0.94, blue: 0.96, alpha: 1.00).cgColor
//    }
    
    
    func configViews(intros: PatientIntroModel?) {
        let rate = intros?.ratio_star ?? 0
        let numberreview = intros?.number_of_reviews ?? 0

        let imageURL = intros?.avatar
        let name = intros?.name
        let major = intros?.majors_name
        let star =  (String(rate) ?? "") + " " + "(" + (String(numberreview) ?? "") + ")"


        configViews(imageURLStr: imageURL, name: name, major: major, star: star)
    }
    
    private func configViews(imageURLStr: String?, name: String?, major: String?, star: String?) {
        Ultilities.loadImage(introImage, strURL: imageURLStr ?? "", placeHolder: nil)
        nameLabel.text = name ?? " "
        majorLabel.text = major ?? " "
        rateLabel.text = star ?? " "
        
        introView.layer.borderWidth = 1.0
        introView.layer.borderColor = UIColor(red: 0.93, green: 0.94, blue: 0.96, alpha: 1.00).cgColor
    }
}
