//
//  RegionSelectBuilder.swift
//  SummerBagFinder
//
//  Created by 정국희 on 2020/06/25.
//  Copyright © 2020 EUIGYOM KIM. All rights reserved.
//

import Foundation

protocol RegionSelectBuildingLogic {
    func build(message: String?) -> RegionSelectViewController
}

class RegionSelectBuilder: RegionSelectBuildingLogic {

    deinit {
        print(#function)
    }
    
    func build(message: String?) -> RegionSelectViewController {
        let viewController = RegionSelectViewController()
        let interactor = RegionSelectInteractor(message: message, worker: RegionSelectWorker())
        let presenter = RegionSelectPresenter()
        let router = RegionSelectRouter(viewController: viewController, storeListBuilder: StoreListBuilder())
        viewController.interactor = interactor
        interactor.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController

        return viewController
    }
}
