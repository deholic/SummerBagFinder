//
//  StoreMapView.swift
//  SummerBagFinder
//
//  Created by 정국희 on 2020/06/29.
//  Copyright © 2020 EUIGYOM KIM. All rights reserved.
//

import SwiftUI
import CoreLocation

#warning("present로 떴을 때 네비게이션 바 추가하기. 현재는 스토어 상세가 동작을 안함")
struct StoreMapView: View {
    
    private let interactor: StoreMapRequestLogic
    @ObservedObject private var presenter: StoreMapPresenter
    
    init(builder: LazyStoreMapBuildingLogic) {
        let (interactor, presenter) = builder.executeBuilding()
        self.interactor = interactor
        self.presenter = presenter
    }
    
    var regionSelectionItem: some View {
        Button(action: {
            interactor.process(StoreMap.Request.ToRegionSelect())
        }) {
            Image(systemName: "gear").imageScale(.large)
        }
    }
    
    var body: some View {

        VStack {
            Text(presenter.viewModel.store.name)
                .font(.title)
            Text(presenter.viewModel.store.address)
            MapView(
                coordinate: presenter.viewModel.store.coordinate,
                name: presenter.viewModel.store.name
            )
            Button(action: {
                interactor.process(StoreMap.Request.ToStoreDetail())
            }) {
                Text("go to StoreDetail")
            }
            // push 화면전환
            NavigationLink(
                destination: StoreDetailView(builder: presenter.storeDetailBuilder),
                tag: StoreMapNextScene.storeDetail,
                selection: $presenter.viewModel.nextScene,
                label: { EmptyView() }
            )
            Text(presenter.viewModel.dynamicMessage)
        }
        .padding()
        .navigationBarTitle("Store Map - SwiftUI")
        .navigationBarItems(trailing: regionSelectionItem)
        .onAppear {
            interactor.process(StoreMap.Request.OnAppear())
        }
        // modal 화면전환
        .sheet(isPresented: $presenter.viewModel.isPresented) {
            if case .regionSelect = presenter.viewModel.nextScene {
                RegionSelectView(builder: presenter.regionSelectBuilder)
            }
        }
    }
}

struct StoreMapView_Previews: PreviewProvider {
    static var previews: some View {
        StoreMapView(builder: StoreMapBuilder())
    }
}


