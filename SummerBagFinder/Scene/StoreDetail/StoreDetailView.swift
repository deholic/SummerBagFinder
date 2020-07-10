//
//  StoreDetailView.swift
//  SummerBagFinder
//
//  Created by 정국희 on 2020/06/29.
//  Copyright © 2020 EUIGYOM KIM. All rights reserved.
//

import SwiftUI

struct StoreDetailView: View {
    
    private let interactor: StoreDetailRequestLogic
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
            TextField("이전화면에 전달할 메시지를 입력하세요.", text: $message) {
                interactor.process(StoreDetail.Request.OnFinishWriting(message: message))
            }
            .padding(.all, 20)
            if true == presenter.viewModel.showWordCountButton {
                Button(
                    action: { interactor.process(StoreDetail.Request.CheckTextCount()) },
                    label: { Text("글자 수 세기") }
                )
            }
        }
        .navigationBarTitle("Store Detail - SwiftUI")
        .alert(item: $presenter.viewModel.alert) {
            Alert(
                title: Text($0.title),
                message: Text($0.message),
                dismissButton: Alert.Button.default(Text($0.confirmTitle))
            )
        }
    }
}

struct StoreDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StoreDetailView(builder: StoreDetailBuilder())
    }
}
