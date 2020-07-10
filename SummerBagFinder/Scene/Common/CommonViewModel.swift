//
//  ViewModel.swift
//  SummerBagFinder
//
//  Created by 정국희 on 2020/07/10.
//  Copyright © 2020 EUIGYOM KIM. All rights reserved.
//

import Foundation

enum CommonViewModel {
    
    struct Alert: Identifiable {
        var id: Int
        let title: String
        let message: String
        let confirmTitle: String
    }
}
