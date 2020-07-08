//
//  StoreMapScene.swift
//  SummerBagFinder
//
//  Created by mine on 2020/06/28.
//  Copyright © 2020 EUIGYOM KIM. All rights reserved.
//

import Foundation

protocol StoreMapSceneLogic {
    func build(store: Store) -> (StoreMapBusinessLogic, StoreMapPresenter)
}

class StoreMapScene: StoreMapSceneLogic {

    func build(store: Store) -> (StoreMapBusinessLogic, StoreMapPresenter) {
        let interactor = StoreMapInteractor()
        let presenter = StoreMapPresenter(storeDetailScene: StoreDetailScene(), regionSelectScene: RegionSelectScene())
        interactor.router = presenter
        interactor.presenter = presenter

        return (interactor, presenter)
    }
}

