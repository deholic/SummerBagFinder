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

import Foundation

// MARK: StoreDetailInteractor

class StoreDetailInteractor: StoreDetailRequestLogic, ObservableObject {
    var router: StoreDetailRoutingLogic?
    var presenter: StoreDetailPresentationLogic?
    private let store: Store
    private let listener: StoreDetailListener?
    
    var message: String? {
        didSet {
            print("message:\(message)")
        }
    }
    
    init(store: Store, listener: StoreDetailListener? = nil) {
        self.store = store
        self.listener = listener
    }
    
    deinit {
        print(#function, #file)
    }
    
    func process(_ request: StoreDetail.Request.CheckTextCount) {
        presenter?.present(StoreDetail.Response.textCount(message?.count ?? 0))

    }
    
    func process(_ request: StoreDetail.Request.OnFinishWriting) {
        message = request.message
        if let message = message {
            listener?.didFinishWriting(message: message)
        }
        presenter?.present(StoreDetail.Response.wordCountButton(show: true))
    }
}

// MARK: protocol

protocol StoreDetailRequestLogic {
    func process(_ request: StoreDetail.Request.CheckTextCount)
    func process(_ request: StoreDetail.Request.OnFinishWriting)
}

protocol StoreDetailPresentationLogic {
    func present(_ response: StoreDetail.Response)
}

protocol StoreDetailRoutingLogic {}

protocol StoreDetailListener {
    func didFinishWriting(message: String)
}
