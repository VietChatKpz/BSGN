//
//  NewTableViewCell.swift
//  AutoLayout
//
//  Created by Nguyễn Đình Việt on 31/05/2022.
//

import UIKit

class NewTableViewCell: UITableViewCell {

    @IBOutlet weak var newImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func configNew(new: newAPI?) {
        let imageURL = new?.picture
        let name = new?.title
        let date = new?.created_at
        
        configNew(imageURL: imageURL, name: name, date: date)
    }
    
    private func configNew(imageURL: String?, name: String?, date: String?) {
        Ultilities.loadImage(newImage, strURL: imageURL ?? "", placeHolder: nil)
        nameLabel.text = name ?? ""
        dateLabel.text = date ?? ""
    }
    
}
