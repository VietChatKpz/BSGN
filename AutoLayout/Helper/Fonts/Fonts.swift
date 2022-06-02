//
//  Fonts.swift
//  AutoLayout
//
//  Created by Nguyễn Đình Việt on 01/06/2022.
//

import Foundation
import UIKit

class Utility {
    
   /// Logs all available fonts from iOS SDK and installed custom font
   class func logAllAvailableFonts() {
      for family in UIFont.familyNames {
      print("\(family)")
      for name in UIFont.fontNames(forFamilyName: family) {
          print("   \(name)")
      }
       }
   }
}
