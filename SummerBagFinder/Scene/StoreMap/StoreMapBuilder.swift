//
//  StoreMapBuilder.swift
//  SummerBagFinder
//
//  Created by mine on 2020/06/28.
//  Copyright © 2020 EUIGYOM KIM. All rights reserved.
//

import Foundation

// MARK: protocol

protocol StoreMapBuildingLogic {
    typealias Destination = (StoreMapRequestLogic, StoreMapPresenter)
    func build(store: Store) -> Destination
}

protocol LazyStoreMapBuildingLogic {
    func prepareForBuilding(store: Store)
    func executeBuilding() -> StoreMapBuildingLogic.Destination
}

// MARK: StoreMapBuilder

final class StoreMapBuilder: containsLazySceneBuildingLogic {
    static var emptyDestination: Destination {
        (StoreMapInteractor(store: Store(id: 0), worker: StoreMapWorker()), StoreMapPresenter(storeDetailBuilder: StoreDetailBuilder(), regionSelectBuilder: RegionSelectBuilder()))
    }
    private(set) var lazyLogic = LazySceneBuildingLogic<Destination>(emptyDestination: StoreMapBuilder.emptyDestination)
}

extension StoreMapBuilder: StoreMapBuildingLogic {
    
    func build(store: Store) -> Destination {
        let interactor = StoreMapInteractor(store: store, worker: StoreMapWorker())
        let presenter = StoreMapPresenter(storeDetailBuilder: StoreDetailBuilder(), regionSelectBuilder: RegionSelectBuilder())
        interactor.router = presenter
        interactor.presenter = presenter

        return (interactor, presenter)
    }
}

extension StoreMapBuilder: LazyStoreMapBuildingLogic {
    
    func prepareForBuilding(store: Store) {
        lazyLogic = LazySceneBuildingLogic(
            logic: {[weak self] in
                self?.build(store: store)
            },
            emptyDestination: Self.emptyDestination
        )
    }
    
    func executeBuilding() -> Destination {
        lazyLogic.execute()
    }
}


