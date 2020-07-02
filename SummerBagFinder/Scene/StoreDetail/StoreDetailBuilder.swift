//
//  StoreDetailBuilder.swift
//  SummerBagFinder
//
//  Created by mine on 2020/06/28.
//  Copyright © 2020 EUIGYOM KIM. All rights reserved.
//

import Foundation

protocol StoreDetailBuildingLogic {
    func build() -> StoreDetailRoutingLogic
}

class StoreDetailBuilder: StoreDetailBuildingLogic {
    func build() -> StoreDetailRoutingLogic {
        let viewController = StoreDetailViewController()
        let interactor = StoreDetailInteractor()
        let presenter = StoreDetailPresenter()
        let router = StoreDetailRouter(viewController: viewController)
        viewController.interactor = interactor
        interactor.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController

        return router
    }
}
