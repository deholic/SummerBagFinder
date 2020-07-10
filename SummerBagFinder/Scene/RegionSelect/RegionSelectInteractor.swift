//
//  RegionSelectInteractor.swift
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

// MARK: RegionSelectInteractor

class RegionSelectInteractor: RegionSelectRequestLogic {
    var router: (NSObjectProtocol & RegionSelectRoutingLogic)?
    var presenter: RegionSelectPresentationLogic?
    private var worker: ResionSelectWorkingLogic?
    
    private var regions: [Region] = []
    private let message: String?
    
    init(message: String?, worker: ResionSelectWorkingLogic) {
        self.worker = worker
        self.message = message
    }
    
    deinit {
        print(#function)
    }
    
    func process(_ request: RegionSelect.Request.OnAppear) {
        if let message = message {
            presenter?.present(RegionSelect.Response.alert(message: message))
        }
    }
    
    func process(_ request: RegionSelect.Request.OnLoad) {

        worker?.fetchRegionList { [weak self] result in
            guard let self = self else { return }
            guard case let .success(regions) = result else { return }
            self.regions = regions
            self.presenter?.present(RegionSelect.Response.regions(regions))
        }
    }
    
    func process(_ request: RegionSelect.Request.OnSelectRegion) {
        let indexPath = request.indexPath
        let subregion = regions[indexPath.section].subregions[indexPath.row]
        
        worker?.fetchStoreList(regionCode: subregion.id) { [weak self] result in
            guard let self = self else { return }
            guard case let .success(stores) = result else { return }
            
            self.router?.routeToStoreList(stores: stores)
        }
    }
}

// MARK: protocol

protocol RegionSelectRequestLogic {
    func process(_ request: RegionSelect.Request.OnLoad)
    func process(_ request: RegionSelect.Request.OnAppear)
    func process(_ request: RegionSelect.Request.OnSelectRegion)
}

protocol RegionSelectPresentationLogic: class {
    func present(_ response: RegionSelect.Response)
}

protocol RegionSelectRoutingLogic {
    func routeToStoreList(stores: [Store]?)
}

protocol ResionSelectWorkingLogic {
    func fetchRegionList(completion: @escaping (Result<[Region], Error>) -> ())
    func fetchStoreList(regionCode: String, completion: @escaping (Result<[Store], Error>) -> ())
}
