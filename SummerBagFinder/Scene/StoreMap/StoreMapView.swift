//
//  StoreMapView.swift
//  SummerBagFinder
//
//  Created by 정국희 on 2020/06/29.
//  Copyright © 2020 EUIGYOM KIM. All rights reserved.
//

import SwiftUI

struct StoreMapView: View {
    
    @ObservedObject var viewController: StoreMapViewController
    
    var regionSelectionItem: some View {
        Button(action: {
            self.viewController.didTapRegionSelection = true
        }) {
            Image(systemName: "gear").imageScale(.large)
        }
    }
    var body: some View {

        VStack {
            Text("StoreMap - SwiftUI")
            Button(action: {
                self.viewController.didTapButton = true
            }) {
                Text("go to StoreDetail")
            }
// modal 방식
            .sheet(isPresented: $viewController.isRegionSelectPresended, onDismiss: {
                self.viewController.isRegionSelectPresended = false
            }) {
                RegionSelectView(sceneBuildingLogic: self.viewController.regionSelectSceneBuildingLogic)
            }
// push 방식
            NavigationLink(
                destination: StoreDetailView(viewController: viewController.storeDetailViewController),
                isActive: $viewController.isStoreDetailPresented
            ) {
                EmptyView()
            }
        }
        .navigationBarItems(trailing: regionSelectionItem)
    }
}


struct StoreMapView_Previews: PreviewProvider {
    static var previews: some View {
        StoreMapView(viewController: StoreMapViewController())
    }
}
