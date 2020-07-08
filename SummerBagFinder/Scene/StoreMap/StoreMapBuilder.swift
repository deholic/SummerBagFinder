//
//  StoreMapBuilder.swift
//  SummerBagFinder
//
//  Created by mine on 2020/06/28.
//  Copyright © 2020 EUIGYOM KIM. All rights reserved.
//

import Foundation

protocol StoreMapBuildingLogic {
    func build(store: Store) -> (StoreMapBusinessLogic, StoreMapPresenter)
}

class StoreMapBuilder: StoreMapBuildingLogic {

    func build(store: Store) -> (StoreMapBusinessLogic, StoreMapPresenter) {
        let interactor = StoreMapInteractor()
        let presenter = StoreMapPresenter(storeDetailBuilder: StoreDetailBuilder(), regionSelectBuilder: RegionSelectBuilder())
        interactor.router = presenter
        interactor.presenter = presenter

        return (interactor, presenter)
    }
}

