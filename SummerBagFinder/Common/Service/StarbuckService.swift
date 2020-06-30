//
//  StarbuckService.swift
//  SummerBagFinder
//
//  Created by EUIGYOM KIM on 2020/06/21.
//  Copyright © 2020 EUIGYOM KIM. All rights reserved.
//

import Foundation
import Moya

enum StarbucksService: TargetType {
    
    case login(_ id: String, _ password: String)
    case getStockList(_ regionCode: String)
    
    var baseURL: URL {
        return URL(string: "https://www.starbucks.co.kr")!
    }
    
    var path: String {
        switch self {
        case .login:
            return "/interface/loginMember.do"
        case .getStockList:
            return "/store/getStoreStockList.do"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login, .getStockList:
            return .post
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .login(let id, let password):
            let parameters = [
                "user_id": id,
                "user_pwd": password,
                "captcha": ""
            ]
            
            return .requestParameters(parameters: parameters, encoding: URLEncoding.httpBody)
            
        case .getStockList(let regionCode):
            let parameters = [
                "stock_data[[0][sku_no]": "9400000000975",
                "stock_data[[0][sku_nm]": "bag_green",
                "stock_data[[0][sku_kor_nm]": "그린",
                "stock_data[[1][sku_no]": "9400000000976",
                "stock_data[[1][sku_nm]": "bag_pink",
                "stock_data[[1][sku_kor_nm]": "핑크",
                "gugun_cd": regionCode
            ]
            
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .login:
            return [
                "Referer": "https://www.starbucks.co.kr/login/login.do",
                "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:77.0) Gecko/20100101 Firefox/77.0"
            ]
        case .getStockList:
            return [
                "Referer": "https://www.starbucks.co.kr:7643/eFrequency/index.do",
                "User-Agent": "Mozilla/5.0 (iPhone; CPU iPhone OS 13_5_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148",
                "Origin": "https://www.starbucks.co.kr:7643"
            ]
        }
    }
    
}
