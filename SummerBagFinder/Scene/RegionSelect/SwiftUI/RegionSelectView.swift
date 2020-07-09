//
//  RegionSelectView.swift
//  SummerBagFinder
//
//  Created by 정국희 on 2020/07/01.
//  Copyright © 2020 EUIGYOM KIM. All rights reserved.
//

import SwiftUI

struct RegionSelectView: UIViewControllerRepresentable {
    
    let builder: LazyRegionSelectBuildingLogic?
    
    func makeUIViewController(context: Context) -> RegionSelectViewController {
        guard let builder = builder else { return RegionSelectViewController() }
        let viewController = builder.executeBuilding()
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: RegionSelectViewController, context: Context) {}
}

