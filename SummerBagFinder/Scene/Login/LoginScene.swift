//
//  LoginScene.swift
//  SummerBagFinder
//
//  Created by 정국희 on 2020/06/25.
//  Copyright © 2020 EUIGYOM KIM. All rights reserved.
//

import Foundation

protocol LoginSceneLogic {
    var viewController: LoginViewController! { get set }
    func build() -> LoginViewController
}

class LoginScene: LoginSceneLogic {
    
    weak var viewController: LoginViewController!
    
    func build() -> LoginViewController {
        let viewController = LoginViewController()
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        let router = LoginRouter(scene: self, regionSelectScene: RegionSelectScene())
        viewController.interactor = interactor
        interactor.presenter = presenter
        interactor.router = router
        presenter.viewController = viewController
        self.viewController = viewController
        
        return viewController
    }
}
