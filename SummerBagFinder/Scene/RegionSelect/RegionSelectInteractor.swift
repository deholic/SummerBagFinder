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

import UIKit

protocol RegionSelectBusinessLogic {
    func viewWillAppear()
    func doFetchRegions()
    func doMoveToStoreList(_ request: RegionSelect.MoveStoreList.Request)
}

protocol ResionSelectWorkingLogic {
    func fetchRegionList(completion: @escaping (Result<[Region], Error>) -> ())
    func fetchStoreList(regionCode: String, completion: @escaping (Result<[Store], Error>) -> ())
}

class RegionSelectInteractor: RegionSelectBusinessLogic {
    var router: (NSObjectProtocol & RegionSelectRoutingLogic)?
    var presenter: RegionSelectPresentationLogic?
    private var worker: ResionSelectWorkingLogic?
    
    private var regions: [Region] = []
    private var stores: [Store]?
    
    private let message: String?
    
    init(message: String?, worker: ResionSelectWorkingLogic) {
        self.worker = worker
        self.message = message
    }
    
    deinit {
        print(#function)
    }
    
    func viewWillAppear() {
        if let message = message {
            presenter?.showMessageAlert(message: message)
        }
    }
    
    func doFetchRegions() {

        worker?.fetchRegionList { [weak self] result in
            guard let self = self else { return }
            guard case let .success(regions) = result else { return }
            self.regions = regions
            let response = RegionSelect.doFetchRegions.Response(regions: regions)
            self.presenter?.presentRegionList(response)
        }
    }
    
    func doMoveToStoreList(_ request: RegionSelect.MoveStoreList.Request) {
        let indexPath = request.indexPath
        let subregion = regions[indexPath.section].subregions[indexPath.row]
        
        worker?.fetchStoreList(regionCode: subregion.id) { [weak self] result in
            guard let self = self else { return }
            guard case let .success(stores) = result else { return }
            
            self.stores = stores
            self.router?.routeToStoreList(stores: stores)
        }
    }
}
