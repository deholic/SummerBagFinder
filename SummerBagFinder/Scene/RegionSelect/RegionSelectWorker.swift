//
//  RegionSelectWorker.swift
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
import Moya

class RegionSelectWorker {
    func fetchRegionList(completion: @escaping (Result<[Region], Error>) -> ()) {
        guard let path = Bundle.main.path(forResource: "regions", ofType: "json") else {
            completion(.failure(BaseError.parseError))
            return
        }
        
        guard let jsonData = FileManager.default.contents(atPath: path) else {
            completion(.failure(BaseError.parseError))
            return
        }
        
        guard let regions = try? JSONDecoder().decode([RegionResponseModel].self, from: jsonData) else {
            completion(.failure(BaseError.parseError))
            return
        }
        
        completion(.success(regions.map{ $0.convertToRegion() }))
    }
    
    func fetchStoreList(regionCode: String, completion: @escaping (Result<[Store], Error>) -> ()) {
        let provider = MoyaProvider<StarbucksService>()
        provider.request(.getStockList(regionCode)) { result in
            switch result {
            case .success(let response):
                guard let data = try? response.map(StoreStockListResponseModel.self) else {
                    completion(.failure(BaseError.parseError))
                    return
                }
                
                completion(.success(data.convertToStores()))
            case .failure(let error):
                completion(.failure(BaseError.serverError(message: error.errorDescription)))
            }
        }
    }
}

// MARK: - REST API Response Model

fileprivate struct RegionResponseModel: Codable {
    let prefix: String
    let name: String
    let subregions: [SubregionModel]
    
    enum CodingKeys: String, CodingKey {
        case prefix
        case name = "region_name"
        case subregions
    }
    
    struct SubregionModel: Codable {
        let id: String
        let name: String
        
        func convertToSubregion() -> Subregion {
            return Subregion(id: id, name: name)
        }
    }
    
    func convertToRegion() -> Region {
        return Region(id: prefix, name: name, subregions: subregions.map{ $0.convertToSubregion() })
    }
}

fileprivate struct StoreStockListResponseModel: Codable {
    let stores: [StoreModel]
    let stocks: [StockModel]
    
    enum CodingKeys: String, CodingKey {
        case stores = "storeList"
        case stocks = "stockList"
    }
    
    func getStoreStock(index: Int) -> StockModel? {
        let store = stores[index]
        let stock = stocks.filter({ Int($0.storeId) == store.id }).first
        return stock
    }
    
    struct StockModel: Codable {
        let storeId: String
        let totalCount: Int
        let greenCount: Int
        let pinkCount: Int
        
        enum CodingKeys: String, CodingKey {
            case storeId = "STORE_CD"
            case totalCount = "TOTAL_COUNT"
            case greenCount = "BAG_GREEN_COUNT"
            case pinkCount = "BAG_PINK_COUNT"
        }
        
        func convertToStock() -> Stock {
            return Stock(totalCount: totalCount, greenCount: greenCount, pinkCount: pinkCount)
        }
    }
    
    struct StoreModel: Codable {
        let id: Int
        let name: String
        let address: String
        let isOpen: String // Bool로 변환가능?
        
        enum CodingKeys: String, CodingKey {
            case id = "store_cd"
            case name = "store_nm"
            case address
            case isOpen = "is_open"
        }
    }
    
    func convertToStores() -> [Store] {
        return stores.enumerated().map {
            let stock = getStoreStock(index: $0)
            let open = ("Y" == $1.isOpen)
            return Store(id: $1.id, name: $1.name, address: $1.address, isOpen: open, stock: stock?.convertToStock())
        }
    }
}


