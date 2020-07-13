//
//  Region.swift
//  SummerBagFinder
//
//  Created by EUIGYOM KIM on 2020/06/21.
//  Copyright © 2020 EUIGYOM KIM. All rights reserved.
//

import Foundation

struct Region {
    let id: String
    let name: String
    let subregions: [Subregion]
}

struct Subregion {
    let id: String
    let name: String
}
