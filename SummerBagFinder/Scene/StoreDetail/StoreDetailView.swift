//
//  StoreDetailView.swift
//  SummerBagFinder
//
//  Created by 정국희 on 2020/06/29.
//  Copyright © 2020 EUIGYOM KIM. All rights reserved.
//

import SwiftUI

struct StoreDetailView: View {
    
    private let interactor: StoreDetailBusinessLogic?
    @ObservedObject private var presenter: StoreDetailPresenter
    
    init(sceneBuildingLogic: (() -> (StoreDetailBusinessLogic, StoreDetailPresenter))?) {
        if let (interactor, presenter) = sceneBuildingLogic?() {
            self.interactor = interactor
            self.presenter = presenter
        } else {
            self.interactor = nil
            self.presenter = StoreDetailPresenter()
        }
    }
    
    var body: some View {
        Text("StoreDetail - SwiftUI")
    }
}


struct StoreDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StoreDetailView(sceneBuildingLogic: nil)
    }
}
