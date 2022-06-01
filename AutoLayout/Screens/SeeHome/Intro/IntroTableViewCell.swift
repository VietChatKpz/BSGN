//
//  IntroTableViewCell.swift
//  AutoLayout
//
//  Created by Nguyễn Đình Việt on 26/05/2022.
//

import UIKit

class IntroTableViewCell: UITableViewCell {

    @IBOutlet weak var introView: UIView!
    @IBOutlet weak var introImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var majorLabel: UILabel!
    @IBOutlet weak var starLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        introView.layer.borderWidth = 1.0
        introView.layer.borderColor = UIColor(red: 0.93, green: 0.94, blue: 0.96, alpha: 1.00).cgColor
        introView.layer.cornerRadius = 12
        introImageView.layer.cornerRadius = 6
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configIntro(intro: introAPI?) {
        let imageURL = intro?.avatar
        let name = (intro?.user_type_name ?? "") + " " + (intro?.full_name ?? "")
        let major = "Chuyên nghành: " + (intro?.majors_name ?? "")
//        let star = (intro?.ratio_star ?? "") + " " + "(" + (intro?.number_of_reviews ?? "") + " đánh giá )"
        
//        configIntro(imageURL: imageURL, name: name, major: major)
        configIntro(imageURL: imageURL, name: name, major: major, star: "")
    }
    
    private func configIntro(imageURL: String?, name: String?, major: String?, star: String?){
        Ultilities.loadImage(introImageView, strURL: imageURL ?? "", placeHolder: nil)
        nameLabel.text = name ?? ""
        majorLabel.text = major ?? ""
        starLabel.text = star ?? ""
    }
    
}
