//
//  StoreDetailView.swift
//  SummerBagFinder
//
//  Created by 정국희 on 2020/06/29.
//  Copyright © 2020 EUIGYOM KIM. All rights reserved.
//

import SwiftUI

struct StoreDetailView: View {
    
    @ObservedObject var viewController: StoreDetailViewController
    
    var body: some View {
        Text("StoreDetail - SwiftUI")
    }
}


struct StoreDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StoreDetailView(viewController: StoreDetailViewController())
    }
}
