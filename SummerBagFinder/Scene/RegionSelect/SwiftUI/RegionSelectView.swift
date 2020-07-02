//
//  RegionSelectView.swift
//  SummerBagFinder
//
//  Created by 정국희 on 2020/07/01.
//  Copyright © 2020 EUIGYOM KIM. All rights reserved.
//

import SwiftUI

struct RegionSelectView: UIViewControllerRepresentable {
    
    let sceneBuildingLogic: (() -> RegionSelectRoutingLogic)?
    
    func makeUIViewController(context: Context) -> RegionSelectViewController {
        guard let sceneBuildingLogic = sceneBuildingLogic else { return RegionSelectViewController() }
        let router = sceneBuildingLogic()
        return router.viewController
    }
    
    func updateUIViewController(_ uiViewController: RegionSelectViewController, context: Context) {}
}

