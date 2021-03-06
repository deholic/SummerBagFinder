//
//  RegionSelectPresenter.swift
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

protocol RegionSelectPresentationLogic {
    func presentRegionList()
    func presentStoreList()
}

class RegionSelectPresenter: RegionSelectPresentationLogic {
    weak var viewController: RegionSelectDisplayLogic?
    
    func presentRegionList() {
        viewController?.displayRegionList()
    }
    
    func presentStoreList() {
        viewController?.displayStoreList()
    }
}
