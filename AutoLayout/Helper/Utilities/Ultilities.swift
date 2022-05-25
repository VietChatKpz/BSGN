//
//  Ultilities.swift
//  AutoLayout
//
//  Created by Nguyễn Đình Việt on 25/05/2022.
//

import Foundation
import MapKit
import SDWebImage

class Ultilities{
    static func loadImage(_ imv: UIImageView, strURL: String, placeHolder: UIImage?) {
        //        imv.sd_setImage(with: URL(string: strURL), placeholderImage: placeHolder)
        
        let url = URL(string: strURL)
        imv.sd_setImage(with: url, placeholderImage: placeHolder) { image, error, cacheType, url in
            if let downLoadedImage = image {
                if cacheType == .none {
                    imv.alpha = 0
                    UIView.transition(with: imv, duration: 0.3, options: .transitionCrossDissolve, animations: {
                        imv.image = downLoadedImage
                        imv.alpha = 1
                    }, completion: nil)
                    
                }
            } else {
                imv.image = placeHolder
            }
        }
    }
}
