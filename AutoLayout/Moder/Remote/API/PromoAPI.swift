//
//  PromoAPI.swift
//  AutoLayout
//
//  Created by Nguyễn Đình Việt on 26/05/2022.
//

import Foundation

class promoAPI {
    
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
    var link: String?
    var type_name: String?
    var amount_text: String?
    var is_bookmark: Bool?
    
    convenience init(id: Int?,
                      category_id: Int?,
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
                      link: String?,
                      type_name: String?,
                      amount_text: String?,
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
        self.link = link
        self.type_name = type_name
        self.amount_text = amount_text
        self.is_bookmark = is_bookmark
    }
    
    convenience init(json: [String: Any]) {
        self.init()
        
        for (key, value) in json {
            if key == "id", let wrapValue = value as? Int{
                let jsonValue = wrapValue
                self.id = jsonValue
            }
            if key == "category_id", let wrapValue = value as? Int {
                let jsonValue = wrapValue
                self.category_id = jsonValue
            }
            if key == "code", let wrapValue = value as? String {
                let jsonValue = wrapValue
                self.code = jsonValue
            }
            if key == "name", let wrapValue = value as? String {
                let jsonValue = wrapValue
                self.name = jsonValue
            }
            if key == "slug", let wrapValue = value as? String {
                let jsonValue = wrapValue
                self.slug = jsonValue
            }
            if key == "content", let wrapValue = value as? String {
                let jsonValue = wrapValue
                self.content = jsonValue
            }
            if key == "picture", let wrapValue = value as? String {
                let jsonValue = wrapValue
                self.picture = jsonValue
            }
            if key == "from_date", let wrapValue = value as? String {
                let jsonValue = wrapValue
                self.from_date = jsonValue
            }
            if key == "to_date", let wrapValue = value as? String {
                let jsonValue = wrapValue
                self.to_date = jsonValue
            }
            if key == "amount", let wrapValue = value as? Int {
                let jsonValue = wrapValue
                self.amount = jsonValue
            }
            if key == "type", let wrapValue = value as? Int {
                let jsonValue = wrapValue
                self.type = jsonValue
            }
            if key == "kind", let wrapValue = value as? Int {
                let jsonValue = wrapValue
                self.kind = jsonValue
            }
            if key == "created_at", let wrapValue = value as? String {
                let jsonValue = wrapValue
                self.created_at = jsonValue
            }
            if key == "category_name", let wrapValue = value as? String {
                let jsonValue = wrapValue
                self.category_name = jsonValue
            }
            if key == "link", let wrapValue = value as? String {
                let jsonValue = wrapValue
                self.link = jsonValue
            }
            if key == "type_name", let wrapValue = value as? String {
                let jsonValue = wrapValue
                self.type_name = jsonValue
            }
            if key == "amount_text", let wrapValue = value as? String {
                let jsonValue = wrapValue
                self.amount_text = jsonValue
            }
            if key == "is_bookmark", let wrapValue = value as? Bool {
                let jsonValue = wrapValue
                self.is_bookmark = jsonValue
            }
        }
    }
}
