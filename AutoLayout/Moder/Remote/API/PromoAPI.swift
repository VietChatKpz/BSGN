//
//  PromoAPI.swift
//  AutoLayout
//
//  Created by Nguyễn Đình Việt on 26/05/2022.
//

import Foundation

class PromoAPI: NSObject, JsonInitObject {
    
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
    var isSelected: Bool?
    
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
                      is_bookmark: Bool?,
                      isSelected: Bool?) {
        
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
        self.isSelected = isSelected
    }
    
    required convenience init(json: [String: Any]) {
        self.init()
        
        if let wrapValue = json["picture"] as? String {
            self.picture = wrapValue
        }
        if let wrapValue = json["name"] as? String {
            self.name = wrapValue
        }
        if let wrapValue = json["created_at"] as? String {
            self.created_at = wrapValue
        }
        if let wrapValue = json["link"] as? String {
            self.link = wrapValue
        }
    }
}
