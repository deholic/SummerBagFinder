//
//  StoreListBuilder.swift
//  SummerBagFinder
//
//  Created by 정국희 on 2020/06/25.
//  Copyright © 2020 EUIGYOM KIM. All rights reserved.
//

import Foundation

protocol StoreListBuildingLogic {
    typealias Destination = StoreListViewController
    func build(stores: [Store]?) -> Destination
}

class StoreListBuilder: StoreListBuildingLogic {
    
    deinit {
        print(#function)
    }
    
    // builder 추가
    func build(stores: [Store]?) -> Destination {
        let destinationVC = StoreListViewController()
        let interactor = StoreListInteractor(stores: stores)
        let presenter = StoreListPresenter()
        let router = StoreListRouter(viewController: destinationVC, storeMapBuilder: StoreMapBuilder())
        destinationVC.interactor = interactor
        interactor.router = router
        interactor.presenter = presenter
        presenter.viewController = destinationVC

        return destinationVC
    }
}
