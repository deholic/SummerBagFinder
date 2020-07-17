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
    
    init(destination: StoreMapBuildingLogic.Destination) {
        //let (interactor, presenter) = builder.getDestination()
        self.interactor = destination.0
        self.presenter = destination.1
        print(#function, #file)
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
            Text(presenter.store.name)
                .font(.title)
            Text(presenter.store.address)
            MapView(
                coordinate: presenter.store.coordinate,
                name: presenter.store.name
            )
            Button(action: {
                interactor.process(StoreMap.Request.ToStoreDetail())
            }) {
                Text("go to StoreDetail")
                    .font(.title)
            }
            // push 화면전환 - 전환되기 전에 StoreMapView 가 생성되면 따라서 StoreDetailView가 생성이 됨 
            NavigationLink(
                destination: StoreDetailView(builder: presenter.storeDetailBuilder),
                tag: StoreMapNextScene.storeDetail,
                selection: $presenter.nextScene,
                label: { EmptyView() }
            )
            Text(presenter.dynamicMessage)
        }
        .padding()
        .navigationBarTitle("매장위치 - SwiftUI")
        .navigationBarItems(trailing: regionSelectionItem)
        .onAppear {
            interactor.process(StoreMap.Request.OnAppear())
        }
        // modal 화면전환
        .sheet(isPresented: $presenter.isPresented) {
            if case .regionSelect = presenter.nextScene {
                RegionSelectView(builder: presenter.regionSelectBuilder)
            }
        }
    }
}

struct StoreMapView_Previews: PreviewProvider {
    static var previews: some View {
        StoreMapView(destination: StoreMapBuilder().getDestination())
    }
}


