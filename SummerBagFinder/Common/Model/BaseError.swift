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
}
