//
//  ExtentionString.swift
//  AutoLayout
//
//  Created by Nguyễn Đình Việt on 01/06/2022.
//

import Foundation
import UIKit

extension String {
    func split(by length: Int, fromEnd: Bool) -> [String] {
        var startIndex = fromEnd ? self.endIndex : self.startIndex
        var results = [Substring]()
        
        if fromEnd == true {
            while startIndex > self.startIndex {
                let endIndex = self.index(startIndex, offsetBy: -length, limitedBy: self.startIndex) ?? self.startIndex
                results.append(self[endIndex..<startIndex])
                startIndex = endIndex
            }
            
            return results.map { String($0) }.reversed()
        }
        
        while startIndex < self.endIndex {
            let endIndex = self.index(startIndex, offsetBy: length, limitedBy: self.endIndex) ?? self.endIndex
            results.append(self[startIndex..<endIndex])
            startIndex = endIndex
        }
        
        return results.map { String($0) }
    }
}

extension UIViewController {
    var safeAreaInsets: UIEdgeInsets {
        if #available(iOS 11.0, *) {
            let window = UIApplication.shared.keyWindow
            return window?.safeAreaInsets ?? .zero
        }
        
        if #available(iOS 13.0, *) {
            let window = UIApplication.shared.windows[0]
            return window.safeAreaInsets
        }
        
        return .zero
    }
}
