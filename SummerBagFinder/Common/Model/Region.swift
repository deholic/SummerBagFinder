//
//  Region.swift
//  SummerBagFinder
//
//  Created by EUIGYOM KIM on 2020/06/21.
//  Copyright © 2020 EUIGYOM KIM. All rights reserved.
//

import Foundation

struct Region: Codable {
    let prefix: String
    let name: String
    let subregions: [Subregion]
    
    enum CodingKeys: String, CodingKey {
        case prefix
        case name = "region_name"
        case subregions
    }
}

struct Subregion: Codable {
    let id: String
    let name: String
}
