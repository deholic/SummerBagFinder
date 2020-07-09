//
//  SceneBuildingLogic.swift
//  SummerBagFinder
//
//  Created by 정국희 on 2020/07/09.
//  Copyright © 2020 EUIGYOM KIM. All rights reserved.
//

import Foundation

struct LazySceneBuildingLogic<T> {
    private let emptyDestination: T
    private let logic: (() -> T?)?
    
    init(logic: (() -> T?)? = nil, emptyDestination: T) {
        self.logic = logic
        self.emptyDestination = emptyDestination
    }
    
    func execute() -> T {
        logic?() ?? emptyDestination
    }
}

protocol containsLazySceneBuildingLogic {
    associatedtype T
    static var emptyDestination: T { get }
    var lazyLogic: LazySceneBuildingLogic<T> { get }
}
