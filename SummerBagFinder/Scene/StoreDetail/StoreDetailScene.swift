//
//  StoreDetailScene.swift
//  SummerBagFinder
//
//  Created by mine on 2020/06/28.
//  Copyright © 2020 EUIGYOM KIM. All rights reserved.
//

import Foundation

protocol StoreDetailSceneLogic {
    var viewController: StoreDetailViewController! { get }
    func build() -> StoreDetailViewController
}

class StoreDetailScene: StoreDetailSceneLogic {
    weak var viewController: StoreDetailViewController!

    func build() -> StoreDetailViewController {
        let viewController = StoreDetailViewController()
        let interactor = StoreDetailInteractor()
        let presenter = StoreDetailPresenter()
        let router = StoreDetailRouter(scene: self)
        viewController.interactor = interactor
        interactor.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        self.viewController = viewController

        return viewController
    }
}
