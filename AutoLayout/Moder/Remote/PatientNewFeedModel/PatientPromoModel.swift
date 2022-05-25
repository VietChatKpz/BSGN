//
//  PatientPromoModel.swift
//  AutoLayout
//
//  Created by Nguyễn Đình Việt on 25/05/2022.
//

import Foundation

class PatientPromoModel {
    
    var id: Int?
    var category_id: Int?
    var code: String?
    var name: String?
    var slug: String?
    var content: String?
    var picture: String?
    var from_date: String?
    var to_date: String?
    var amount: Int?
    var type: Int?
    var kind: Int?
    var created_at: String?
    var category_name: String?
    var amount_text: String?
    var link: String?
    var is_bookmark: Bool?
    
    convenience init(id: Int?,
                     category_id: Int,
                     code: String?,
                     name: String?,
                     slug: String?,
                     content: String?,
                     picture: String?,
                     from_date: String?,
                     to_date: String?,
                     amount: Int?,
                     type: Int?,
                     kind: Int?,
                     created_at: String?,
                     category_name: String?,
                     amount_text: String?,
                     link: String?,
                     is_bookmark: Bool?) {

        self.init()
        self.id = id
        self.category_id = category_id
        self.code = code
        self.name = name
        self.slug = slug
        self.content = content
        self.picture = picture
        self.from_date = from_date
        self.to_date = to_date
        self.amount = amount
        self.type = type
        self.kind = kind
        self.created_at = created_at
        self.category_name = category_name
        self.amount_text = amount_text
        self.link = link
        self.is_bookmark = is_bookmark
    }
    
    convenience init(json: [String: Any]){
        self.init()
        
        for (key, value) in json {
            if key == "id", let srapValue = value as? Int {
                let jsonValue = srapValue
                self.id = jsonValue
            }
            if key == "category_id", let srapValue = value as? Int {
                let jsonValue = srapValue
                self.category_id = jsonValue
            }
            if key == "code", let srapValue = value as? String {
                let jsonValue = srapValue
                self.code = jsonValue
            }
            if key == "name", let srapValue = value as? String {
                let jsonValue = srapValue
                self.name = jsonValue
            }
            if key == "slug", let srapValue = value as? String {
                let jsonValue = srapValue
                self.slug = jsonValue
            }
            if key == "content", let srapValue = value as? String {
                let jsonValue = srapValue
                self.content = jsonValue
            }
            if key == "picture", let srapValue = value as? String {
                let jsonValue = srapValue
                self.picture = jsonValue
            }
            if key == "from_date", let srapValue = value as? String {
                let jsonValue = srapValue
                self.from_date = jsonValue
            }
            if key == "to_date", let srapValue = value as? String {
                let jsonValue = srapValue
                self.to_date = jsonValue
            }
            if key == "amount", let srapValue = value as? Int {
                let jsonValue = srapValue
                self.amount = jsonValue
            }
            if key == "type", let srapValue = value as? Int {
                let jsonValue = srapValue
                self.type = jsonValue
            }
            if key == "kind", let srapValue = value as? Int {
                let jsonValue = srapValue
                self.kind = jsonValue
            }
            if key == "created_at", let srapValue = value as? String {
                let jsonValue = srapValue
                self.created_at = jsonValue
            }
            if key == "category_name", let srapValue = value as? String {
                let jsonValue = srapValue
                self.category_name = jsonValue
            }
            if key == "amount_text", let srapValue = value as? String {
                let jsonValue = srapValue
                self.amount_text = jsonValue
            }
            if key == "link", let srapValue = value as? String {
                let jsonValue = srapValue
                self.link = jsonValue
            }
            if key == "is_bookmark", let srapValue = value as? Bool {
                let jsonValue = srapValue
                self.is_bookmark = jsonValue
            }
        }
    }
}
