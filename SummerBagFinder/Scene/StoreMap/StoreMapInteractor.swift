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

import Foundation
import CoreLocation

// MARK: StoreMapInteractor

class StoreMapInteractor: StoreMapRequestLogic {
    var router: StoreMapRoutingLogic?
    var presenter: StoreMapPresentationLogic?
    var worker: StoreMapWorker?
    
    let store: Store
    var messageFromDetail: String?
    
    init(store: Store) {
        self.store = store
    }
    
    func process(_ request: StoreMap.Request.OnAppear) {
        let response = StoreMap.Response.store(
            store: store,
            coordinate: CLLocationCoordinate2DMake(37.4997260, 127.034936)
        )
        presenter?.present(response)
        if let message = messageFromDetail {
            presenter?.present(StoreMap.Response.fromDetail(message: message))
        }
    }
    
    func process(_ request: StoreMap.Request.ToStoreDetail) {
        router?.routeToStoreDetail(store: store, listener: self)
    }
    
    func process(_ request: StoreMap.Request.ToRegionSelect) {
        router?.routeToRegionSelection(message: "Store Map에서 온 메시지")
    }
}

// MARK: StoreDetailListener

extension StoreMapInteractor: StoreDetailListener {
    
    func didFinishWriting(message: String) {
        // 리스닝한 데이터를 바로 반영하면 스토어 상세화면이 리프레시 되어버림. 저장해두었다가 스토어 상세화면에서 돌아왔을 때 화면에 표시함
        messageFromDetail = message
    }
}

// MARK: protocol

protocol StoreMapRequestLogic {
    func process(_ request: StoreMap.Request.OnAppear)
    func process(_ request: StoreMap.Request.ToStoreDetail)
    func process(_ request: StoreMap.Request.ToRegionSelect)
}

protocol StoreMapPresentationLogic {
    func present(_ response: StoreMap.Response)
}

protocol StoreMapRoutingLogic {
    func routeToStoreDetail(store: Store, listener: StoreDetailListener?)
    func routeToRegionSelection(message: String?)
}
