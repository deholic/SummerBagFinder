//
//  StoreMapScene.swift
//  SummerBagFinder
//
//  Created by mine on 2020/06/28.
//  Copyright © 2020 EUIGYOM KIM. All rights reserved.
//

import Foundation

protocol StoreMapSceneLogic {
    var viewController: StoreMapViewController! { get }
    func build(store: Store) -> StoreMapViewController
}

class StoreMapScene: StoreMapSceneLogic {
    weak var viewController: StoreMapViewController!
    
    func build(store: Store) -> StoreMapViewController {
        let viewController = StoreMapViewController()
        let interactor = StoreMapInteractor()
        let presenter = StoreMapPresenter()
        let router = StoreMapRouter(scene: self, storeDetailScene: StoreDetailScene(), regionSelectScene: RegionSelectScene())
        viewController.interactor = interactor
        interactor.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        self.viewController = viewController

        return viewController
    }
}
