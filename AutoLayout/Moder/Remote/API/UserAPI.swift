//
//  UserAPI.swift
//  AutoLayout
//
//  Created by Nguyễn Đình Việt on 01/06/2022.
//

import Foundation

class userAPI {
    var name: String?
    var last_name: String?
    var birth_date: String?
    var sex: Int?
    var phone: String?
    var contact_email: String?
    
    convenience init(name: String?,
                     last_name: String?,
                     birth_date: String?,
                     sex: Int?,
                     phone: String?,
                     contact_email: String?) {
        self.init()
        self.name = name
        self.last_name = last_name
        self.birth_date = birth_date
        self.sex = sex
        self.phone = phone
        self.contact_email = contact_email
    }
    
    convenience init(json: [String: Any]) {
        self.init()
        
        for (key, value) in json {

            if key == "name", let wrapValue = value as? String {
                let jsonValue = wrapValue
                self.name = jsonValue
            }
            if key == "last_name", let wrapValue = value as? String {
                let jsonValue = wrapValue
                self.last_name = jsonValue
            }
            if key == "birth_date", let wrapValue = value as? String {
                let jsonValue = wrapValue
                self.birth_date = jsonValue
            }
            if key == "sex", let wrapValue = value as? Int {
                let jsonValue = wrapValue
                self.sex = jsonValue
            }
            if key == "phone", let wrapValue = value as? String {
                let jsonValue = wrapValue
                self.phone = jsonValue
            }
            if key == "contact_email", let wrapValue = value as? String {
                let jsonValue = wrapValue
                self.contact_email = jsonValue
            }
        }
    }
}
