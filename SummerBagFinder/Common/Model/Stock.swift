//
//  Stock.swift
//  SummerBagFinder
//
//  Created by EUIGYOM KIM on 2020/06/21.
//  Copyright © 2020 EUIGYOM KIM. All rights reserved.
//

import Foundation

struct Stock {
    let totalCount: Int
    let greenCount: Int
    let pinkCount: Int
}

extension Stock {
    var canBuyBag: Bool {
        totalCount > 0
    }
}
