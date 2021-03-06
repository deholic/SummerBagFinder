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

import UIKit

protocol StoreListBusinessLogic {
    
}

protocol StoreListDataStore {
    var dataList: StoreStockList? { get set }
    func getStoreStock(index: Int) -> Stock?
}

class StoreListInteractor: StoreListBusinessLogic, StoreListDataStore {
    var presenter: StoreListPresentationLogic?
    
    var dataList: StoreStockList?
    
    func getStoreStock(index: Int) -> Stock? {
        let store = dataList?.stores[index]
        let stock = dataList?.stocks.filter({ Int($0.storeId) == store?.id }).first
        return stock
    }
}
