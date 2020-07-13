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
    
    init(totalCount: Int = 0, greenCount: Int = 0, pinkCount: Int = 0) {
        self.totalCount = totalCount
        self.greenCount = greenCount
        self.pinkCount = pinkCount
    }
}

extension Stock {
    var canBuyBag: Bool {
        totalCount > 0
    }
}
