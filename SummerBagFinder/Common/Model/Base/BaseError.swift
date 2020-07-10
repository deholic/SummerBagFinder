//
//  BaseError.swift
//  SummerBagFinder
//
//  Created by EUIGYOM KIM on 2020/06/21.
//  Copyright © 2020 EUIGYOM KIM. All rights reserved.
//

import Foundation

enum BaseError: Error {
    case loginFailure
    case requiredLogin
    case parseError
    case serverError(message: String?)
    
    static let generalMessage = "에러가 발생했습니다. 잠시 후 다시 시도해주세요."
    var description: String {
        switch self {
        case .loginFailure:
            return "로그인에 실패했습니다.\n아이디와 패스워드를 다시 확인해 주세요."
        case let .serverError(message):
            return message ?? Self.generalMessage
        default:
            return Self.generalMessage
        }
    }
}
