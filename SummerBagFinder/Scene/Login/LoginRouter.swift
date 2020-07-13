//
//  LoginRouter.swift
//  SummerBagFinder
//
//  Created by EUIGYOM KIM on 2020/06/21.
//  Copyright (c) 2020 EUIGYOM KIM. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

final class LoginRouter: NSObject {
    private var regionSelectBuilder: RegionSelectBuildingLogic
    private weak var viewController: UIViewController!
    
    init(viewController: UIViewController, regionSelectBuilder: RegionSelectBuildingLogic) {
        self.viewController = viewController
        self.regionSelectBuilder = regionSelectBuilder
    }
}

extension LoginRouter: LoginRoutingLogic {
    func routeToRegionList(message: String?) {
        ///라우팅: 유킷 -> 유킷
        let regionVC = regionSelectBuilder.build(message: message)
  
        viewController.show(regionVC, sender: nil)
    }
}
