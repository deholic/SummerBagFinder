//
//  BaseResponse.swift
//  SummerBagFinder
//
//  Created by EUIGYOM KIM on 2020/06/21.
//  Copyright © 2020 EUIGYOM KIM. All rights reserved.
//

import Foundation

struct BaseResponse: Codable {
    var resultCode: String
    var alertMessage: String
    
    enum CodingKeys: String, CodingKey {
        case resultCode = "result_code"
        case alertMessage = "alert_msg"
    }
}
