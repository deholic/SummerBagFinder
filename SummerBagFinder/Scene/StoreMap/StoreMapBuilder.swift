//
//  StoreMapBuilder.swift
//  SummerBagFinder
//
//  Created by mine on 2020/06/28.
//  Copyright © 2020 EUIGYOM KIM. All rights reserved.
//

import Foundation

protocol StoreMapBuildingLogic {
    func build(store: Store) -> StoreMapRoutingLogic
}

class StoreMapBuilder: StoreMapBuildingLogic {
    func build(store: Store) -> StoreMapRoutingLogic {
        let viewController = StoreMapViewController()
        let interactor = StoreMapInteractor()
        let presenter = StoreMapPresenter()
        let router = StoreMapRouter(viewController: viewController, storeDetailBuilder: StoreDetailBuilder(), regionSelectBuilder: RegionSelectBuilder())
        viewController.interactor = interactor
        interactor.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController

        return router
    }
}
