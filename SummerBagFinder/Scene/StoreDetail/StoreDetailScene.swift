//
//  StoreDetailScene.swift
//  SummerBagFinder
//
//  Created by mine on 2020/06/28.
//  Copyright © 2020 EUIGYOM KIM. All rights reserved.
//

import Foundation

protocol StoreDetailSceneLogic {
    var routerDelegate: StoreDetailPresenter! { get }
    func build(store: Store) -> (StoreDetailInteractor, StoreDetailPresenter)
}

class StoreDetailScene: StoreDetailSceneLogic {
    var routerDelegate: StoreDetailPresenter!
    
    func build(store: Store) -> (StoreDetailInteractor, StoreDetailPresenter) {
        let interactor = StoreDetailInteractor(store: store)
        let presenter = StoreDetailPresenter()
        let router = StoreDetailRouter(scene: self)
        interactor.router = router
        interactor.presenter = presenter
        self.routerDelegate = presenter

        return (interactor, presenter)
    }
}
