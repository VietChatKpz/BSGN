//
//  PatientNewFeedModel.swift
//  AutoLayout
//
//  Created by Nguyễn Đình Việt on 25/05/2022.
//

import Foundation

class PatientNewFeedModel: NSObject, JsonInitObject {
    var newList: [PatientNewModel]?
    var promoList: [PatientPromoModel]?
    var introList: [PatientIntroModel]?
    var promoItems: [promoAPI]?
    var introItem: [introAPI]?
    var newItem: [newAPI]?
    var userItem: [userAPI]?
    var locationItem: [LocationAPI]?
    
    convenience init(newList: [PatientNewModel]?,
                              promoList: [PatientPromoModel]?,
                              introList: [PatientIntroModel]?,
                              promoItems: [promoAPI]?,
                              introItems: [introAPI]?,
                              newItem: [newAPI]?,
                              userItem: [userAPI]?,
                              locationItem: [LocationAPI]?) {
        
        self.init()
        self.newList = newList
        self.promoList = promoList
        self.introList = introList
        self.promoItems = promoItems
        self.introItem = introItems
        self.newItem = newItem
        self.userItem = userItem
        self.locationItem = locationItem
    }
    
    required convenience init(json: [String : Any]) {
        self.init()
        
        for (key, value) in json {
            if key == "articleList", let wrapValue = value as? [[String: Any]] {
                let jsonValue = wrapValue.map({ PatientNewModel(json: $0)})
                self.newList = jsonValue
            }
            if key == "promotionList", let wrapValue = value as? [[String: Any]] {
                let jsonValue = wrapValue.map({ PatientPromoModel(json: $0)})
                self.promoList = jsonValue
            }
            if key == "doctorList", let wrapValue = value as? [[String: Any]] {
                let jsonValue = wrapValue.map({ PatientIntroModel(json: $0)})
                self.introList = jsonValue
            }
            if key == "items", let wrapValue = value as? [[String: Any]] {
                let jsonValue = wrapValue.map({ promoAPI(json: $0)})
                self.promoItems = jsonValue
            }
            if key == "items", let wrapValue = value as? [[String: Any]] {
                let jsonValue = wrapValue.map({ introAPI(json: $0)})
                self.introItem = jsonValue
            }
            if key == "items", let wrapValue = value as? [[String: Any]] {
                let jsonValue = wrapValue.map({ newAPI(json: $0)})
                self.newItem = jsonValue
            }
            if key == "data", let wrapValue = value as? [[String: Any]] {
                let jsonValue = wrapValue.map({ userAPI(json: $0)})
                self.userItem = jsonValue
            }
            if key == "data", let wrapValue = value as? [[String: Any]] {
                let jsonValue = wrapValue.map({ LocationAPI(json: $0)})
                self.locationItem = jsonValue
            }
        }
    }
}
