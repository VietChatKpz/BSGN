//
//  LocationAPI.swift
//  AutoLayout
//
//  Created by Nguyễn Đình Việt on 10/06/2022.
//

import Foundation

class LocationAPI {
    var province_name: String?
    var district_name: String?
    var ward_name: String?
    
    convenience init(province_name: String?,
                     district_name: String?,
                     ward_name: String?) {
        self.init()
    }
    
    convenience init(json: [String: Any]){
        self.init()
        
        if let wrapValue = json["province_name"] as? String {
            self.province_name = wrapValue
        }
        if let wrapValue = json["district_name"] as? String {
            self.district_name = wrapValue
        }
        if let wrapValue = json["ward_name"] as? String {
            self.ward_name = wrapValue
        }
    }
}
