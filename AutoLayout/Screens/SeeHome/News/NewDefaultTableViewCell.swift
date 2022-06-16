//
//  NewDefaultTableViewCell.swift
//  AutoLayout
//
//  Created by Nguyễn Đình Việt on 16/06/2022.
//

import UIKit

class NewDefaultTableViewCell: UITableViewCell {

    @IBOutlet weak var newImg: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configNew(new: NewAPI?) {
        let imageURL = new?.picture
        let name = new?.title
        let date = new?.created_at
        
        configNew(imageURL: imageURL, name: name, date: date)
    }
    
    private func configNew(imageURL: String?, name: String?, date: String?) {
        Ultilities.loadImage(newImg, strURL: imageURL ?? "", placeHolder: nil)
        nameLabel.text = name ?? ""
        dateLabel.text = date ?? ""
    }
}
