//
//  Store.swift
//  SummerBagFinder
//
//  Created by EUIGYOM KIM on 2020/06/21.
//  Copyright © 2020 EUIGYOM KIM. All rights reserved.
//

import Foundation

struct Store {
    let id: Int
    let name: String
    let address: String
    let isOpen: Bool // Bool로 변환가능?
    let stock: Stock?
    
    init(id: Int, name: String = "", address: String = "", isOpen: Bool = false, stock: Stock? = nil) {
        self.id = id
        self.name = name
        self.address = address
        self.isOpen = isOpen
        self.stock = stock
    }
}
