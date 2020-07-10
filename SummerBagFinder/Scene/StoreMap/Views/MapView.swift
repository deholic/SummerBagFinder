//
//  StoreMapView.swift
//  SummerBagFinder
//
//  Created by 정국희 on 2020/07/09.
//  Copyright © 2020 EUIGYOM KIM. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    let coordinate: CLLocationCoordinate2D
    let name: String
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView()
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let camera = MKMapCamera(
            lookingAtCenter: coordinate,
            fromDistance: 2500,
            pitch: 45,
            heading: 0
        )
        uiView.setCamera(camera, animated: true)
        let pin = MKPointAnnotation()
        pin.title = name
        pin.coordinate = coordinate
        uiView.addAnnotation(pin)
    }
}


