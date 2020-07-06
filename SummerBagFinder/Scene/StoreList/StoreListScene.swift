//
//  StoreListScene.swift
//  SummerBagFinder
//
//  Created by 정국희 on 2020/06/25.
//  Copyright © 2020 EUIGYOM KIM. All rights reserved.
//

import Foundation

protocol StoreListSceneLogic {
    var viewController: StoreListViewController! { get }
    func build(stores: [Store]?) -> StoreListViewController
}

class StoreListScene: StoreListSceneLogic {
    weak var viewController: StoreListViewController!
    
    deinit {
        print(#function)
    }
    
    // builder 추가
    func build(stores: [Store]?) -> StoreListViewController {
        let destinationVC = StoreListViewController()
        let interactor = StoreListInteractor(stores: stores)
        let presenter = StoreListPresenter()
        let router = StoreListRouter(scene: self)
        destinationVC.interactor = interactor
        interactor.router = router
        interactor.presenter = presenter
        presenter.viewController = destinationVC
        self.viewController = destinationVC
        
        return viewController
    }
}
