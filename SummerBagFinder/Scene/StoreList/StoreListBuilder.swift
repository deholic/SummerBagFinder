//
//  StoreListBuilder.swift
//  SummerBagFinder
//
//  Created by 정국희 on 2020/06/25.
//  Copyright © 2020 EUIGYOM KIM. All rights reserved.
//

import Foundation

protocol StoreListBuildingLogic {
    func build(stores: [Store]?) -> RoutingLogic
}

class StoreListBuilder: StoreListBuildingLogic {
    
    // builder 추가
    func build(stores: [Store]?) -> RoutingLogic {
        let destinationVC = StoreListViewController()
        let interactor = StoreListInteractor(stores: stores)
        let presenter = StoreListPresenter()
        let router = StoreListRouter(viewController: destinationVC)
        destinationVC.interactor = interactor
        interactor.router = router
        interactor.presenter = presenter
        presenter.viewController = destinationVC
        
        return router
    }
}
