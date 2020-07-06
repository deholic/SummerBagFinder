//
//  StoreMapViewController.swift
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
import SwiftUI


// SwiftUI 뷰에서 사용
protocol StoreMapViewControllingLogic: ViewControllingLogic {
    var didTapButton: Bool  { get set }
    var didTapRegionSelection: Bool { get set }
    var isStoreDetailPresented: Bool { get }
    var storeDetailViewController: StoreDetailViewController { get }
    var isRegionSelectPresended: Bool { get }
    var regionSelectSceneBuildingLogic: (() -> RegionSelectViewController)? { get }
}

protocol StoreMapDisplayLogic: class {
    func displaySomething(viewModel: StoreMap.DidTapButton.ViewModel)
}

class StoreMapViewController: ObservableObject, StoreMapViewControllingLogic  {
    var interactor: StoreMapBusinessLogic?
    
    @Published var didTapButton = false {
        willSet {
            interactor?.didTapButton(StoreMap.DidTapButton.Request())
        }
    }
    @Published var didTapRegionSelection = false {
        willSet {
            interactor?.didTapRegionSelection(StoreMap.DidTapRegionSelection.Request())
        }
    }
    
    @Published var isStoreDetailPresented: Bool = false
    @Published var storeDetailViewController: StoreDetailViewController = StoreDetailViewController()
    @Published var isRegionSelectPresended: Bool = false
    @Published var regionSelectSceneBuildingLogic: (() -> RegionSelectViewController)? = nil
}

extension StoreMapViewController: StoreMapDisplayLogic {
    func displaySomething(viewModel: StoreMap.DidTapButton.ViewModel) {
        //nameTextField.text = viewModel.name
    }
}

