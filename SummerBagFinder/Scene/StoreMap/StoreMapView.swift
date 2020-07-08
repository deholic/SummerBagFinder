//
//  StoreMapView.swift
//  SummerBagFinder
//
//  Created by 정국희 on 2020/06/29.
//  Copyright © 2020 EUIGYOM KIM. All rights reserved.
//

import SwiftUI

struct StoreMapView: View {
    
    let interactor: StoreMapBusinessLogic
    @ObservedObject var presenter: StoreMapPresenter
    
    var regionSelectionItem: some View {
        Button(action: {
            self.interactor.didTapRegionSelection(StoreMap.DidTapRegionSelection.Request())
        }) {
            Image(systemName: "gear").imageScale(.large)
        }
    }
    var body: some View {

        VStack {
            Text("StoreMap - SwiftUI")
            Button(action: {
                self.interactor.didTapButton(StoreMap.DidTapButton.Request())
            }) {
                Text("go to StoreDetail")
            }
// modal 방식
            .sheet(isPresented: $presenter.isRegionSelectPresended, onDismiss: {
                self.presenter.isRegionSelectPresended = false
            }) {
                RegionSelectView(sceneBuildingLogic: self.presenter.regionSelectSceneBuildingLogic)
            }
// push 방식
            NavigationLink(
                destination: StoreDetailView(interactor: self.presenter.storeDetailInteractor, presenter: self.presenter.storeDetailPresenter),
                isActive: $presenter.isStoreDetailPresented
            ) {
                EmptyView()
            }
        }
        .navigationBarItems(trailing: regionSelectionItem)
    }
}


struct StoreMapView_Previews: PreviewProvider {
    static var previews: some View {
        StoreMapView(interactor: StoreMapInteractor(), presenter: StoreMapPresenter())
    }
}
