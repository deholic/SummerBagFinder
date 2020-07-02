//
//  StoreDetailInteractor.swift
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

protocol StoreDetailBusinessLogic {
    func doSomething(request: StoreDetail.Something.Request)
}

protocol StoreDetailDataStore {
    //var name: String { get set }
}

class StoreDetailInteractor: StoreDetailBusinessLogic, StoreDetailDataStore {
    var router: (NSObjectProtocol & StoreDetailRoutingLogic)?
    var presenter: StoreDetailPresentationLogic?
    var worker: StoreDetailWorker?
    //var name: String = ""
    
    // MARK: Do something
    
    func doSomething(request: StoreDetail.Something.Request) {
        worker = StoreDetailWorker()
        worker?.doSomeWork()
        
        let response = StoreDetail.Something.Response()
        presenter?.presentSomething(response: response)
    }
}
