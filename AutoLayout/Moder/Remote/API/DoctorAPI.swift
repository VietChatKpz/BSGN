//
//  IntroAPI.swift
//  AutoLayout
//
//  Created by Nguyễn Đình Việt on 26/05/2022.
//

import Foundation

class DoctorAPI: NSObject, JsonInitObject{
    
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
    
    required convenience init(json: [String: Any]){
        self.init()
        
        if let wrapValue = json["ratio_star"] as? Int {
            self.ratio_star = wrapValue
        }
        if let wrapValue = json["number_of_reviews"] as? Int {
            self.number_of_reviews = wrapValue
        }
        if let wrapValue = json["avatar"] as? String {
            self.avatar = wrapValue
        }
        if let wrapValue = json["user_type_name"] as? String {
            self.user_type_name = wrapValue
        }
        if let wrapValue = json["full_name"] as? String {
            self.full_name = wrapValue
        }
        if let wrapValue = json["majors_name"] as? String {
            self.majors_name = wrapValue
        }
    }
}
