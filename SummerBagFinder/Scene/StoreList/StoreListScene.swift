//
//  StoreListScene.swift
//  SummerBagFinder
//
//  Created by 정국희 on 2020/06/25.
//  Copyright © 2020 EUIGYOM KIM. All rights reserved.
//

import Foundation

protocol StoreListSceneLogic {
    func build(stores: [Store]?) -> StoreListViewController
}

class StoreListScene: StoreListSceneLogic {
    
    deinit {
        print(#function)
    }
    
    // builder 추가
    func build(stores: [Store]?) -> StoreListViewController {
        let destinationVC = StoreListViewController()
        let interactor = StoreListInteractor(stores: stores)
        let presenter = StoreListPresenter()
        let router = StoreListRouter(viewController: destinationVC, storeMapScene: StoreMapScene())
        destinationVC.interactor = interactor
        interactor.router = router
        interactor.presenter = presenter
        presenter.viewController = destinationVC

        return destinationVC
    }
}
