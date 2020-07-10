//
//  StoreListInteractor.swift
//  SummerBagFinder
//
//  Created by EUIGYOM KIM on 2020/06/21.
//  Copyright (c) 2020 EUIGYOM KIM. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import Foundation

// MARK: StoreListInteractor

class StoreListInteractor {
    var router: (NSObjectProtocol & StoreListRoutingLogic)?
    var presenter: StoreListPresentationLogic?
    deinit {
        print(#function)
    }
    var stores: [Store]?
    
    init(stores: [Store]?) {
        self.stores = stores
    }
}

extension StoreListInteractor: StoreListRequestLogic {
    
    func process(_ request: StoreList.Request.OnLoad) {
        if let stores = stores {
            presenter?.present(StoreList.Response.stores(stores))
        }
    }
    
    func process(_ request: StoreList.Request.DidSelectStore) {
        if let store = stores?[request.index] {
            router?.routeToStoreMap(store: store)
        }
    }
}

// MARK: protocol

protocol StoreListRequestLogic {
    func process(_ request: StoreList.Request.OnLoad)
    func process(_ request: StoreList.Request.DidSelectStore)
}

protocol StoreListPresentationLogic: class {
    func present(_ response: StoreList.Response)
}

protocol StoreListRoutingLogic {
    func routeToStoreMap(store: Store)
}

