//
//  StoreMapModels.swift
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
import CoreLocation

enum StoreMap {

    enum Request {
        struct OnAppear {}
        struct ToStoreDetail {}
        struct ToRegionSelect {}
    }
    
    enum Response {
        case fromDetail(message: String)
        case store(store: Store, coordinate: CLLocationCoordinate2D)
    }
    
    struct ViewModel {
        var nextScene: StoreMapNextScene?
        var isPresented: Bool
        var dynamicMessage: String
        var store: Store
        //var storeDetailDestination: StoreDetailBuilder.Destination
        
        init() {
            isPresented = false
            dynamicMessage = ""
            store = Store(
                name: "",
                address: "",
                coordinate: CLLocationCoordinate2DMake(0, 0)
            )
            //storeDetailDestination = StoreDetailBuilder().emptyDestination
        }

        struct Store {
            let name: String
            let address: String
            let coordinate: CLLocationCoordinate2D
        }
    }
}
