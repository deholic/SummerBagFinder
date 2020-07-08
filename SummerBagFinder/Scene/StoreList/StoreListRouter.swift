//
//  StoreListRouter.swift
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
import SwiftUI

class StoreListRouter: NSObject, StoreListRoutingLogic {
    weak var viewController: UIViewController!
    private var storeMapBuilder: StoreMapBuildingLogic
    
    deinit {
        print(#function)
    }
    
    init(viewController: UIViewController, storeMapBuilder: StoreMapBuildingLogic) {
        self.viewController = viewController
        self.storeMapBuilder = storeMapBuilder
    }
    
    func routeToStoreMap(store: Store) {
        ///라우팅: 유킷  ->  스유
        let sceneBuildingLogic: () -> (StoreMapBusinessLogic, StoreMapPresenter) = {
            return self.storeMapBuilder.build(store: store)
        }
        
        let destination = UIHostingController(rootView: StoreMapView(sceneBuildingLogic: sceneBuildingLogic))
        viewController.show(destination, sender: nil)
    }
}
