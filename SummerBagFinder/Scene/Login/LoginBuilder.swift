//
//  LoginBuilder.swift
//  SummerBagFinder
//
//  Created by 정국희 on 2020/06/25.
//  Copyright © 2020 EUIGYOM KIM. All rights reserved.
//

import UIKit

protocol LoginBuidingLogic {
    typealias Destination = LoginViewController
    func build() -> Destination
}

class LoginBuilder: LoginBuidingLogic {
    
    func build() -> Destination {
        let viewController = LoginViewController()
        let interactor = LoginInteractor(worker: LoginWorker())
        let presenter = LoginPresenter()
        let router = LoginRouter(viewController: viewController, regionSelectBuilder: RegionSelectBuilder())
        viewController.interactor = interactor
        interactor.presenter = presenter
        interactor.router = router
        presenter.viewController = viewController

        return viewController
    }
}
