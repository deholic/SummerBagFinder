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
    func getDestination() -> Destination
}

// MARK: StoreMapBuilder

final class StoreMapBuilder {
    
    private var destination: Destination?

    private static var emptyDestination: Destination = (
        StoreMapInteractor(store: Store(id: 0), worker: StoreMapWorker()),
        StoreMapPresenter(
            storeDetailBuilder: StoreDetailBuilder(),
            regionSelectBuilder: RegionSelectBuilder()
        )
    )
}

extension StoreMapBuilder: StoreMapBuildingLogic {
    func getDestination() -> Destination {
        destination ?? Self.emptyDestination
    }
    
    func build(store: Store) -> Destination {
        let interactor = StoreMapInteractor(store: store, worker: StoreMapWorker())
        let presenter = StoreMapPresenter(storeDetailBuilder: StoreDetailBuilder(), regionSelectBuilder: RegionSelectBuilder())
        interactor.router = presenter
        interactor.presenter = presenter
        //destination = (interactor, presenter)
        return (interactor, presenter)
    }
}



