//
//  StoreMapView.swift
//  SummerBagFinder
//
//  Created by 정국희 on 2020/06/29.
//  Copyright © 2020 EUIGYOM KIM. All rights reserved.
//

import SwiftUI

struct StoreMapView: View {
    
    private let interactor: StoreMapBusinessLogic?
    @ObservedObject private var presenter: StoreMapPresenter

    init(builder: LazyStoreMapBuildingLogic) {
        let (interactor, presenter) = builder.executeBuilding()
        self.interactor = interactor
        self.presenter = presenter
    }
    
    var regionSelectionItem: some View {
        Button(action: {
            self.interactor?.didTapRegionSelection(StoreMap.Request.DidTapRegionSelection())
        }) {
            Image(systemName: "gear").imageScale(.large)
        }
    }
    
    var body: some View {

        VStack {
            Text("StoreMap - SwiftUI")
            Button(action: {
                self.interactor?.didTapButton(StoreMap.Request.DidTapButton())
            }) {
                Text("go to StoreDetail")
            }
// push 방식
            NavigationLink(
                destination: StoreDetailView(builder:self.presenter.storeDetailBuilder),
                tag: StoreMapNextScene.storeDetail,
                selection: $presenter.nextScene,
                label: { EmptyView() }
            )
            Text(presenter.MessageFromDetail)
        }
        .navigationBarItems(trailing: regionSelectionItem)
// modal 방식
        .sheet(isPresented: $presenter.isPresented, onDismiss: {
            self.presenter.isPresented = false
        }) {
            if case .regionSelect = presenter.nextScene {
                RegionSelectView(builder: self.presenter.regionSelectBuilder)
            }
        }
    }
}


struct StoreMapView_Previews: PreviewProvider {
    static var previews: some View {
        StoreMapView(builder: StoreMapBuilder())
    }
}


