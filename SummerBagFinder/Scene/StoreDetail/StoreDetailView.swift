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
    
    init(builder: StoreDetailBuildingLogic) {
        let (interactor, presenter) = builder.getDestination()
        self.interactor = interactor
        self.presenter = presenter
    }
    
    var body: some View {
        VStack() {
            HStack(spacing: 20) {
                Text("매장주소")
                    .bold()
                Text(presenter.viewModel.store.address)
                Spacer()
            }
            .padding()
            Text(presenter.viewModel.store.status)
            TextField("이전화면에 전달할 메시지를 입력하세요.", text: $message) {
                interactor.process(StoreDetail.Request.OnFinishWriting(message: message))
            }
            .font(.body)
            .padding(.all, 20)
            if true == presenter.viewModel.showWordCountButton {
                Button(
                    action: { interactor.process(StoreDetail.Request.CheckTextCount()) },
                    label: { Text("글자 수 세기") }
                )
            }
            Spacer()
            // push 화면전환 - 전환되기 전에 StoreDetailView가 생성되면 따라서 StoreMapView가 생성이 됨
            NavigationLink(
                destination: StoreMapView(destination: presenter.storeMapBuilder.getDestination()),
                tag: StoreDetailNextScene.storeMap,
                selection: $presenter.viewModel.nextScene,
                label: { EmptyView() }
            )
        }
        .font(.title)
        .navigationBarTitle(presenter.viewModel.store.name + " - SwiftUI")
        .onAppear {
            interactor.process(StoreDetail.Request.OnAppear())
        }
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
