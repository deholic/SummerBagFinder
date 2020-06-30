//
//  Stock.swift
//  SummerBagFinder
//
//  Created by EUIGYOM KIM on 2020/06/21.
//  Copyright © 2020 EUIGYOM KIM. All rights reserved.
//

import Foundation

struct Stock: Codable {
    let storeId: String
    let totalCount: Int
    let greenCount: Int
    let pinkCount: Int
    
    enum State {
        case available
        case warning
        case outOfStock
    }
    
    enum CodingKeys: String, CodingKey {
        case storeId = "STORE_CD"
        case totalCount = "TOTAL_COUNT"
        case greenCount = "BAG_GREEN_COUNT"
        case pinkCount = "BAG_PINK_COUNT"
    }
}

extension Stock {
    var canBuyBag: Bool {
        totalCount > 0
    }
    
    var state: State {
        if totalCount > 5 {
            return .available
        } else if totalCount > 0 {
            return .warning
        } else {
            return .outOfStock
        }
    }
}
