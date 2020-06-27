//
//  StoreListBuilder.swift
//  SummerBagFinder
//
//  Created by 정국희 on 2020/06/25.
//  Copyright © 2020 EUIGYOM KIM. All rights reserved.
//

import Foundation

protocol StoreListBuildable {
    func build(stores: [Store]?) -> StoreListRoutingLogic
}

class StoreListBuilder: StoreListBuildable {
    
    // builder 추가
    func build(stores: [Store]?) -> StoreListRoutingLogic {
        let destinationVC = StoreListViewController()
        let interactor = StoreListInteractor()
        let presenter = StoreListPresenter()
        let router = StoreListRouter(viewController: destinationVC)
        destinationVC.interactor = interactor
        interactor.router = router
        interactor.presenter = presenter
        presenter.viewController = destinationVC
        router.viewController = destinationVC
        interactor.stores = stores
        
        return router
    }
}
