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

    func getDestination() -> Destination
}

// MARK: StoreDetailBuilder

final class StoreDetailBuilder {
    
    private var destination: Destination?
    
    init() {
        print(#function, #file)
    }
    var emptyDestination: Destination {
        (StoreDetailInteractor(store: Store(id: 0), worker: StoreDetailWorker(), listener: nil), StoreDetailPresenter(storeMapBuilder: StoreMapBuilder()))
    }
    
    deinit {
        print(#function, #file)
    }
}

extension StoreDetailBuilder: StoreDetailBuildingLogic {
    
    func getDestination() -> Destination {
        destination ?? emptyDestination
    }

    func build(store: Store, listener: StoreDetailListener?) -> Destination {
        let interactor = StoreDetailInteractor(store: store, worker: StoreDetailWorker(), listener: listener)
        let presenter = StoreDetailPresenter(storeMapBuilder: StoreMapBuilder())
        interactor.router = presenter
        interactor.presenter = presenter
        destination = (interactor, presenter)
        return (interactor, presenter)
    }
}

