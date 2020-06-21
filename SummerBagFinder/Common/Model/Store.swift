//
//  Store.swift
//  SummerBagFinder
//
//  Created by EUIGYOM KIM on 2020/06/21.
//  Copyright © 2020 EUIGYOM KIM. All rights reserved.
//

import Foundation

struct Store: Codable {
    let id: Int
    let name: String
    let address: String
    let isOpen: String
    
    enum CodingKeys: String, CodingKey {
        case id = "store_cd"
        case name = "store_nm"
        case address
        case isOpen = "is_open"
    }
}

struct StoreStockList: Codable {
    let stores: [Store]
    let stocks: [Stock]
    
    enum CodingKeys: String, CodingKey {
        case stores = "storeList"
        case stocks = "stockList"
    }
}
