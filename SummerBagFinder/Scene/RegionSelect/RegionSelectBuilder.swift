//
//  RegionSelectBuilder.swift
//  SummerBagFinder
//
//  Created by 정국희 on 2020/06/25.
//  Copyright © 2020 EUIGYOM KIM. All rights reserved.
//

import Foundation

protocol RegionSelectBuilable {
    func build() -> RegionSelectRoutingLogic
}

class RegionSelectBuilder: RegionSelectBuilable {
    
    func build() -> RegionSelectRoutingLogic {
        let viewController = RegionSelectViewController()
        let interactor = RegionSelectInteractor()
        let presenter = RegionSelectPresenter()
        let router = RegionSelectRouter(viewController: viewController, storeListBuilder: StoreListBuilder())
        viewController.interactor = interactor
        interactor.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        
        return router
    }
}
