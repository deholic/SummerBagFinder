//
//  StoreDetailBuilder.swift
//  SummerBagFinder
//
//  Created by mine on 2020/06/28.
//  Copyright © 2020 EUIGYOM KIM. All rights reserved.
//

import Foundation

// MARK: Protocol

protocol StoreDetailBuildingLogic {
    typealias Destination = (StoreDetailInteractor, StoreDetailPresenter)
    func build(store: Store, listener: StoreDetailListener?) -> Destination
}

protocol LazyStoreDetailBuildingLogic {
    func prepareForBuilding(store: Store, listener: StoreDetailListener?)
    func executeBuilding() -> StoreDetailBuildingLogic.Destination
}

// MARK: StoreDetailBuilder

class StoreDetailBuilder: containsLazySceneBuildingLogic {
    
    static var emptyDestination: Destination {
        (StoreDetailInteractor(store: Store(id: 0), listener: nil), StoreDetailPresenter())
    }
    
    private(set) var lazyLogic = LazySceneBuildingLogic<Destination>(emptyDestination: StoreDetailBuilder.emptyDestination)

    deinit {
        print(#function, #file)
    }
}

extension StoreDetailBuilder: StoreDetailBuildingLogic {
    
    func build(store: Store, listener: StoreDetailListener?) -> Destination {
        let interactor = StoreDetailInteractor(store: store, listener: listener)
        let presenter = StoreDetailPresenter()
        interactor.router = presenter
        interactor.presenter = presenter

        return (interactor, presenter)
    }
}

extension StoreDetailBuilder: LazyStoreDetailBuildingLogic {
    
    func prepareForBuilding(store: Store, listener: StoreDetailListener? = nil) {
        lazyLogic = LazySceneBuildingLogic (
            logic:{[weak self] in
                self?.build(store: store, listener: listener)
            },
            emptyDestination: Self.emptyDestination
        )
    }

    func executeBuilding() -> Destination {
        lazyLogic.execute()
    }
}
