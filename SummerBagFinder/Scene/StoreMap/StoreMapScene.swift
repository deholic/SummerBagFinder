//
//  StoreMapScene.swift
//  SummerBagFinder
//
//  Created by mine on 2020/06/28.
//  Copyright © 2020 EUIGYOM KIM. All rights reserved.
//

import Foundation

protocol StoreMapSceneLogic {
    var routerDelegate: StoreMapPresenter! { get }
    func build(store: Store) -> (StoreMapBusinessLogic, StoreMapPresenter)
}

class StoreMapScene: StoreMapSceneLogic {
    weak var routerDelegate: StoreMapPresenter!
    
    func build(store: Store) -> (StoreMapBusinessLogic, StoreMapPresenter) {
        let interactor = StoreMapInteractor()
        let presenter = StoreMapPresenter()
        let router = StoreMapRouter(scene: self, storeDetailScene: StoreDetailScene(), regionSelectScene: RegionSelectScene())
        interactor.router = router
        interactor.presenter = presenter
        routerDelegate = presenter
        
        return (interactor, presenter)
    }
}
