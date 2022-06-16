//
//  APIUtilities.swift
//  AutoLayout
//
//  Created by Nguyễn Đình Việt on 25/05/2022.
//

import Foundation
import Alamofire

protocol JsonInitObject: NSObject {
    init(json: [String: Any])
}

//B1: Khai báo kiểu dữ liệu API
final class APIUtilities {
    static let domain = "https://gist.githubusercontent.com"
    static let responseDataKey = "data"
    static let responseItemsKey = "items"
    static let responseCodeKey = "code"
    static let responseMessageKey = "message"
    
    //B4:
    static func requestHomePatientFeed(completionHandler: ((PatientNewFeedModel?, APIError?)-> Void)?){
        
        let tailStrURL = "/hdhuy179/f967ffb777610529b678f0d5c823352a/raw"
        
        jsonResponseObject(tailStrURL: tailStrURL, method: .get, headers: [:], completionHandler: completionHandler)
    }
    static func requestDoctor(completionHandler: (([DoctorAPI]?, APIError?)-> Void)?) {
        let taiURL = "/hdhuy179/9ac0a89969b46fb67bc7d1a8b94d180e/raw"
        
        jsonResponseObjects(tailStrURL: taiURL, method: .get, headers: [:], completionHandler: completionHandler)
    }
    static func requestPromo(completionHandler: (([PromoAPI]?, APIError?)-> Void)?) {
        let taiURL = "/hdhuy179/ef03ed850ad56f0136fe3c5916b3280b/raw/Training_Intern_BasicApp_Promotion"
        
        jsonResponseObjects(tailStrURL: taiURL, method: .get, headers: [:], completionHandler: completionHandler)
    }
    static func requestNew(completionHandler: (([NewAPI]?, APIError?)-> Void)?) {
        let taiURL = "/hdhuy179/84d1dfe96f2c0ab1ddea701df352a7a6/raw"
        
        jsonResponseObjects(tailStrURL: taiURL, method: .get, headers: [:], completionHandler: completionHandler)
    }


    static func requestUser(completionHandler: ((UserAPI?, APIError?)-> Void)?) {
        let taiURL = "/hdhuy179/7883b8f11ea4b25cf6d3822c67049606/raw/Training_Intern_BasicApp_UserInfo"
        
        jsonResponseObject(tailStrURL: taiURL, method: .get, headers: [:], completionHandler: completionHandler)

    }
    
    static func requestLocation(textProvi: String?, textDis: String?, war: String?, completionHandler: ((LocationAPI?, APIError?)-> Void)?) {
        let textProvi = textProvi ?? ""
        let textDis = textDis ?? ""
        let war = war ?? ""
        let taiURL = "/hdhuy179/7883b8f11ea4b25cf6d3822c67049606/raw/province_code=\(textProvi)&district_code=\(textDis)&ward_code=\(war)"
        
        jsonResponseObject(tailStrURL: taiURL, method: .get, headers: [:], completionHandler: completionHandler)
    }

    //MARK: Viết riêng request...
//    static func requestHomePatientFeed(APIURL: String?, completionHandler: ((PatientNewFeedModel?, APIError?)-> Void)?){
////            let tailStrURL = "/hdhuy179/ef03ed850ad56f0136fe3c5916b3280b/raw/Training_Intern_BasicApp_Promotion"
////        let tailStrURL = "/hdhuy179/f967ffb777610529b678f0d5c823352a/raw"
//        let tailStrURL = APIURL
//
//        jsonResponseObject(tailStrURL: tailStrURL!, method: .get, headers: [:], completionHandler: completionHandler)
//    }
    //B3:
    static private func jsonResponseObject<T: JsonInitObject>(tailStrURL: String, method: HTTPMethod, headers: HTTPHeaders, completionHandler: ((T?, APIError?) -> Void)?) {
        jsonResponse(tailStrURL: tailStrURL, isPublicAPI: false, method: method, headers: headers) { response, serverCode, serverMessage in
            switch response.result {
            case .success(let value):
                guard serverCode == 200 else {
                    completionHandler?(nil, .serverError(serverCode, serverMessage))
                    return
                }
                
                guard let responseDict = value as? [String: Any],
                      let dataDict = responseDict[responseDataKey] as? [String: Any] else {
                    completionHandler?(nil, .responseFormatError)
                    return
                }
                
                let obj = T(json: dataDict)
                
                completionHandler?(obj, nil)
                
            case .failure(let error):
                completionHandler?(nil, .unowned(error))
            }
        }
    }
    
    static private func jsonResponseObjects<T: JsonInitObject>(tailStrURL: String, method: HTTPMethod, headers: HTTPHeaders, completionHandler: (([T]?, APIError?) -> Void)?) {
        
        jsonResponse(tailStrURL: tailStrURL, isPublicAPI: false, method: method, headers: headers) { response, serverCode, serverMessage in
            
            switch response.result {
            case .success(let value):
                guard serverCode == 200 else {
                    completionHandler?(nil, .serverError(serverCode, serverMessage))
                    return
                }
                
                guard let responseDict = value as? [String: Any],
                      let dataDicts = responseDict[responseDataKey] as? [String: Any] else {
                          completionHandler?(nil, .responseFormatError	)
                          return
                      }
                guard let itemDicts = dataDicts[responseItemsKey] as? [[String: Any]] else {
                        completionHandler?(nil, .responseFormatError)
                        return
                    }
                
                var objs: [T] = []
                
                for itemDict in itemDicts {
                    objs.append(T(json: itemDict))
                }
                
                completionHandler?(objs, nil)
                
            case .failure(let error):
                completionHandler?(nil, .unowned(error))
            }
        }
    }

    //B2: Khai báo Json
    static private func jsonResponse(tailStrURL: String,
                                     isPublicAPI: Bool,
                                     method: HTTPMethod,
                                     parameters: Parameters? = nil,
                                     encoding: ParameterEncoding = JSONEncoding.default,
                                     headers: HTTPHeaders = [:],
                                     completionHandler: ((AFDataResponse<Any>, Int?, String?) -> Void)?) {
        //Kiểm tra URL
        guard let url = URL(string: domain + tailStrURL) else {return}
        
        //Dùng AlamoFire bóc tách dữ liệu
        AF.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers)
            .responseJSON { response in
                
                var serverCode: Int? = nil
                var serverMessage: String? = nil
                
                switch response.result {
                case .success(let value):
                    serverCode = (value as? [String: Any])?[responseCodeKey] as? Int
                    serverMessage = (value as? [String: Any])?[responseMessageKey] as? String
                case .failure(_):
                    break
                }
                
                completionHandler?(response, serverCode, serverMessage)
            }
    }
}

extension APIUtilities {
    enum APIError: Error {
        case responseFormatError
        case serverError(Int?, String?)
        case unowned(Error)
    }
}
