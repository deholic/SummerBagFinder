//
//  StoreMapView.swift
//  SummerBagFinder
//
//  Created by 정국희 on 2020/07/09.
//  Copyright © 2020 EUIGYOM KIM. All rights reserved.
//

import SwiftUI
import MapKit

struct StoreMapView: UIViewRepresentable {
    let coordinate: CLLocationCoordinate2D
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView()
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let camera: MKMapCamera(
            lookingAtCenter: coordinate,
            formDistance: 2500,
            pitch: 45,
            heading: 0
        )
        uiView.setCamera(camera, animated: true)
    }
}


