//
//  LoginBuilder.swift
//  SummerBagFinder
//
//  Created by 정국희 on 2020/06/25.
//  Copyright © 2020 EUIGYOM KIM. All rights reserved.
//

import Foundation

protocol LoginBuildingLogic {
    func build() -> LoginRoutingLogic
}

class LoginBuilder: LoginBuildingLogic {
    
    func build() -> LoginRoutingLogic {
        let viewController = LoginViewController()
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        let router = LoginRouter(viewController: viewController, regionSelectBuilder: RegionSelectBuilder())
        viewController.interactor = interactor
        interactor.presenter = presenter
        interactor.router = router
        presenter.viewController = viewController
        
        return router
    }
}
