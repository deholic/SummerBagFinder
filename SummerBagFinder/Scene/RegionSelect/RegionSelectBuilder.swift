//
//  RegionSelectBuilder.swift
//  SummerBagFinder
//
//  Created by 정국희 on 2020/06/25.
//  Copyright © 2020 EUIGYOM KIM. All rights reserved.
//

import Foundation

protocol RegionSelectBuildingLogic {
    typealias Destination = RegionSelectViewController
    func build(message: String?) -> Destination
}

protocol LazyRegionSelectBuildingLogic {
    func prepareForBuilding(message: String?)
    func executeBuilding() -> RegionSelectBuildingLogic.Destination
}

final class RegionSelectBuilder {
    
    private var message: String?
    
    deinit {
        print(#function)
    }
}

extension RegionSelectBuilder: RegionSelectBuildingLogic {
    func build(message: String?) -> Destination {
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

extension RegionSelectBuilder: LazyRegionSelectBuildingLogic {
    
    func prepareForBuilding(message: String?) {
        self.message = message
    }
    
    func executeBuilding() -> RegionSelectViewController {
        build(message: message)
    }
}
