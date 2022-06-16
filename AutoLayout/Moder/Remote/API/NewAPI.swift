//
//  NewAPI.swift
//  AutoLayout
//
//  Created by Nguyễn Đình Việt on 26/05/2022.
//

import Foundation

class NewAPI: NSObject, JsonInitObject {
    var id: Int?
    var category_id: Int?
    var title: String?
    var slug: String?
    var summary: String?
    var content: String?
    var picture: String?
    var picture_caption: String?
    var created_at: String?
    var category_name: String?
    var link: String?
    
    convenience init(id: Int?,
                      category_id: Int?,
                      title: String?,
                      slug: String?,
                      summary: String?,
                      content: String?,
                      picture: String?,
                      picture_caption: String?,
                      created_at: String?,
                      category_name: String?,
                      link: String?){
        
        self.init()
        self.id = id
        self.category_id = category_id
        self.title = title
        self.slug = slug
        self.summary = summary
        self.content = content
        self.picture = picture
        self.picture_caption = picture_caption
        self.created_at = created_at
        self.category_name = category_name
        self.link = link
    }
    
    required convenience init(json: [String:Any]) {
        self.init()
        
        if let wrapValue = json["picture"] as? String {
            self.picture = wrapValue
        }
        if let wrapValue = json["title"] as? String {
            self.title = wrapValue
        }
        if let wrapValue = json["created_at"] as? String {
            self.created_at = wrapValue
        }
        if let wrapValue = json["link"] as? String {
            self.link = wrapValue
        }
    }
}
