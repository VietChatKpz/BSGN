//
//  UserAPI.swift
//  AutoLayout
//
//  Created by Nguyễn Đình Việt on 01/06/2022.
//

import Foundation

class UserAPI: NSObject, JsonInitObject {
    var name: String?
    var last_name: String?
    var birth_date: String?
    var sex: Int?
    var phone: String?
    var contact_email: String?
    var blood_name: String?
    var full_address: String?
    var province_code: String?
    var district_code: String?
    var ward_code: String?

    convenience init(name: String?,
                     last_name: String?,
                     birth_date: String?,
                     sex: Int?,
                     phone: String?,
                     contact_email: String?,
                     blood_name: String?,
                     full_address: String?,
                     province_code: String?,
                     district_code: String?,
                     ward_code: String?) {
        self.init()
        self.name = name
        self.last_name = last_name
        self.birth_date = birth_date
        self.sex = sex
        self.phone = phone
        self.contact_email = contact_email
        self.blood_name = blood_name
        self.full_address = full_address
        self.province_code = province_code
        self.district_code = district_code
        self.ward_code = ward_code
    }

    required convenience init(json: [String: Any]) {
        self.init()

        if let wrapValue = json["name"] as? String {
            self.name = wrapValue
        }
        if let wrapValue = json["last_name"] as? String {
            self.last_name = wrapValue
        }
        if let wrapValue = json["birth_date"] as? String {
            self.birth_date = wrapValue
        }
        if let wrapValue = json["sex"] as? Int {
            self.sex = wrapValue
        }
        if let wrapValue = json["phone"] as? String {
            self.phone = wrapValue
        }
        if let wrapValue = json["contact_email"] as? String {
            self.contact_email = wrapValue
        }
        if let wrapValue = json["blood_name"] as? String {
            self.blood_name = wrapValue
        }
        if let wrapValue = json["full_address"] as? String {
            self.full_address = wrapValue
        }
        if let wrapValue = json["province_code"] as? String {
            self.province_code = wrapValue
        }
        if let wrapValue = json["district_code"] as? String {
            self.district_code = wrapValue
        }
        if let wrapValue = json["ward_code"] as? String {
            self.ward_code = wrapValue
        }
    }
}


