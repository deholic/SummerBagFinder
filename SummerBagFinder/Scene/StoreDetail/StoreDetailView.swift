//
//  StoreDetailView.swift
//  SummerBagFinder
//
//  Created by 정국희 on 2020/06/29.
//  Copyright © 2020 EUIGYOM KIM. All rights reserved.
//

import SwiftUI

struct StoreDetailView: View {
    
    private let interactor: StoreDetailBusinessLogic
    @ObservedObject private var presenter: StoreDetailPresenter
    @State var message: String = ""
    
    init(builder: LazyStoreDetailBuildingLogic) {
        let (interactor, presenter) = builder.executeBuilding()
        self.interactor = interactor
        self.presenter = presenter
    }
    
    var body: some View {
        VStack {
            Text("StoreDetail - SwiftUI")
            TextField("message", text: $message) {
                self.interactor.didFinishWriting(request: StoreDetail.Request.DidFinishWriting(message: self.message))
            }
            .padding(.all, 20)
            if true == self.presenter.showConfirmButtion {
                Button(action: {}, label: { Text("확인") })
            }
        }
        .onDisappear {
            self.interactor.viewDidDisappear()
        }
    }
}

struct StoreDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StoreDetailView(builder: StoreDetailBuilder())
    }
}
