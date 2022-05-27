//
//  IntroAPI.swift
//  AutoLayout
//
//  Created by Nguyễn Đình Việt on 26/05/2022.
//

import Foundation

class introAPI{
    
    var id: Int?
    var full_name: String?
    var name: String?
    var last_name: String?
    var birth_date: String?
    var contact_email: String?
    var phone: String?
    var avatar: String?
    var blood_name: String?
    var sex_name: String?
    var majors_name: String?
    var user_type_name: String?
    var ratio_star: Int?
    var number_of_reviews: Int?
    var number_of_stars: Int?
    var working_hour: String?
    var training_place: String?
    var degree: String?
    var created_at: String?
    
    convenience init(id: Int?,
                      full_name: String?,
                      name: String?,
                      last_name: String?,
                      birth_date: String?,
                      contact_email: String?,
                      phone: String?,
                      avatar: String?,
                      blood_name: String?,
                      sex_name: String?,
                      majors_name: String?,
                      user_type_name: String?,
                      ratio_star: Int?,
                      number_of_reviews: Int?,
                      number_of_stars: Int?,
                      working_hour: String?,
                      training_place: String?,
                      degree: String?,
                      created_at: String?){
        self.init()
        self.id = id
        self.full_name = full_name
        self.name = name
        self.last_name = last_name
        self.birth_date = birth_date
        self.contact_email = contact_email
        self.phone = phone
        self.avatar = avatar
        self.blood_name = blood_name
        self.sex_name = sex_name
        self.majors_name = majors_name
        self.user_type_name = user_type_name
        self.ratio_star = ratio_star
        self.number_of_reviews = number_of_reviews
        self.number_of_stars = number_of_stars
        self.working_hour = working_hour
        self.training_place = training_place
        self.degree = degree
        self.created_at = created_at
    }
    
    convenience init(json: [String: Any]){
        self.init()
        
        for (key, value) in json {
            if key == "id", let wrapValue = value as? Int {
                let jsonValue = wrapValue
                self.id = jsonValue
            }
            if key == "full_name", let wrapValue = value as? String {
                let jsonValue = wrapValue
                self.full_name = jsonValue
            }
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
            if key == "contact_email", let wrapValue = value as? String {
                let jsonValue = wrapValue
                self.contact_email = jsonValue
            }
            if key == "phone", let wrapValue = value as? String {
                let jsonValue = wrapValue
                self.phone = jsonValue
            }
            if key == "avatar", let wrapValue = value as? String {
                let jsonValue = wrapValue
                self.avatar = jsonValue
            }
            if key == "blood_name", let wrapValue = value as? String {
                let jsonValue = wrapValue
                self.blood_name = jsonValue
            }
            if key == "sex_name", let wrapValue = value as? String {
                let jsonValue = wrapValue
                self.sex_name = jsonValue
            }
            if key == "majors_name", let wrapValue = value as? String {
                let jsonValue = wrapValue
                self.majors_name = jsonValue
            }
            if key == "user_type_name", let wrapValue = value as? String {
                let jsonValue = wrapValue
                self.user_type_name = jsonValue
            }
            if key == "ratio_star", let wrapValue = value as? Int {
                let jsonValue = wrapValue
                self.ratio_star = jsonValue
            }
            if key == "number_of_reviews", let wrapValue = value as? Int {
                let jsonValue = wrapValue
                self.number_of_reviews = jsonValue
            }
            if key == "number_of_stars", let wrapValue = value as? Int {
                let jsonValue = wrapValue
                self.number_of_stars = jsonValue
            }
            if key == "working_hour", let wrapValue = value as? String {
                let jsonValue = wrapValue
                self.working_hour = jsonValue
            }
            if key == "training_place", let wrapValue = value as? String {
                let jsonValue = wrapValue
                self.training_place = jsonValue
            }
            if key == "degree", let wrapValue = value as? String {
                let jsonValue = wrapValue
                self.degree = jsonValue
            }
            if key == "created_at", let wrapValue = value as? String {
                let jsonValue = wrapValue
                self.created_at = jsonValue
            }
        }
    }
}
