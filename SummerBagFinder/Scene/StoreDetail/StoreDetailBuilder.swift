//
//  StoreDetailScene.swift
//  SummerBagFinder
//
//  Created by mine on 2020/06/28.
//  Copyright © 2020 EUIGYOM KIM. All rights reserved.
//

import Foundation

protocol StoreDetailBuildingLogic {
    func build(store: Store) -> (StoreDetailInteractor, StoreDetailPresenter)
}

class StoreDetailBuilder: StoreDetailBuildingLogic {
    
    func build(store: Store) -> (StoreDetailInteractor, StoreDetailPresenter) {
        let interactor = StoreDetailInteractor(store: store)
        let presenter = StoreDetailPresenter()
        interactor.router = presenter
        interactor.presenter = presenter

        return (interactor, presenter)
    }
}
