//
//  RegionSelectBuilder.swift
//  SummerBagFinder
//
//  Created by 정국희 on 2020/06/25.
//  Copyright © 2020 EUIGYOM KIM. All rights reserved.
//

import Foundation

protocol RegionSelectBuildingLogic {
    func build() -> RoutingLogic
}

class RegionSelectBuilder: RegionSelectBuildingLogic {
    
    func build() -> RoutingLogic {
        let viewController = RegionSelectViewController()
        let interactor = RegionSelectInteractor()
        let presenter = RegionSelectPresenter()
        let router = RegionSelectRouter(viewController: viewController, storeListBuilder: StoreListBuilder())
        viewController.interactor = interactor
        interactor.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        return router
    }
}
