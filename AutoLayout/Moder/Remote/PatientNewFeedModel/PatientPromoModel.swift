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
        if let wrapValue = json["id"] as? Int {
            self.id = wrapValue
        }
        if let wrapValue = json["category_id"] as? Int {
            self.category_id = wrapValue
        }
        if let wrapValue = json["code"] as? String {
            self.code = wrapValue
        }
        if let wrapValue = json["name"] as? String {
            self.name = wrapValue
        }
        if let wrapValue = json["slug"] as? String {
            self.slug = wrapValue
        }
        if let wrapValue = json["content"] as? String {
            self.content = wrapValue
        }
        if let wrapValue = json["picture"] as? String {
            self.picture = wrapValue
        }
        if let wrapValue = json["from_date"] as? String {
            self.from_date = wrapValue
        }
        if let wrapValue = json["to_date"] as? String {
            self.to_date = wrapValue
        }
        if let wrapValue = json["amount"] as? Int {
            self.amount = wrapValue
        }
        if let wrapValue = json["type"] as? Int {
            self.type = wrapValue
        }
        if let wrapValue = json["kind"] as? Int {
            self.kind = wrapValue
        }
        if let wrapValue = json["created_at"] as? String {
            self.created_at = wrapValue
        }
        if let wrapValue = json["category_name"] as? String {
            self.category_name = wrapValue
        }
        if let wrapValue = json["amount_text"] as? String {
            self.amount_text = wrapValue
        }
        if let wrapValue = json["link"] as? String {
            self.link = wrapValue
        }
        if let wrapValue = json["is_bookmark"] as? Bool {
            self.is_bookmark = wrapValue
        }
    }
}
