//
//  StoreListPresenter.swift
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

final class StoreListPresenter {
    weak var viewController: StoreListDisplayLogic?
    
    deinit {
        print(#function, #file)
    }
}

extension StoreListPresenter: StoreListPresentationLogic {
    
    func present(_ response: StoreList.Response) {
        switch response {
        case let .stores(stores):
            self.displayStoreStockList(stores)
        }
    }
}

extension StoreListPresenter {
    
    private func displayStoreStockList(_ stores: [Store]) {
 
        let viewModel = StoreList.ViewModel.Stores(
            stores: stores.map{
                StoreList.ViewModel.Store(
                    name: $0.name,
                    address: $0.address,
                    stock: StoreList.ViewModel.Stock(
                        status: self.makeStockStatus(from: $0.stock),
                        iconColor: self.makeStockIconColor(from: $0.stock)
                    )
                )
            }
        )
        
        viewController?.display(viewModel)
    }
    
    private func makeStockStatus(from stock: Stock?) -> String {
        stock == nil ? "Unknown" : "G: \(stock!.greenCount) / P: \(stock!.pinkCount)"
    }
    
    private func makeStockIconColor(from stock: Stock?) -> UIColor {
        guard let stock = stock else { return .systemRed }
        return true == stock.canBuyBag ? .systemGreen : .systemRed
    }
}

// MARK: protocol

protocol StoreListDisplayLogic: class {
    func display(_ viewModel: StoreList.ViewModel.Stores)
}
