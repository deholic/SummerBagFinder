//
//  StoreMapInteractor.swift
//  
//
//  Created by mine on 2020/06/28.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol StoreMapBusinessLogic {
    func didTapButton(_ request: StoreMap.DidTapButton.Request)
    func didTapRegionSelection(_ request: StoreMap.DidTapRegionSelection.Request)
}

protocol StoreMapDataStore {
    //var name: String { get set }
}

class StoreMapInteractor: StoreMapBusinessLogic, StoreMapDataStore {
    var router: (NSObjectProtocol & StoreMapRoutingLogic)?
    var presenter: StoreMapPresentationLogic?
    var worker: StoreMapWorker?
    //var name: String = ""
    
    // MARK: Do something
    
    func didTapButton(_ request: StoreMap.DidTapButton.Request) {
        router?.routeToStoreDetail()
    }
    
    func didTapRegionSelection(_ request: StoreMap.DidTapRegionSelection.Request) {
        router?.routeToRegionSelection(message: "Store Map에서 온 메시지")
    }
}
