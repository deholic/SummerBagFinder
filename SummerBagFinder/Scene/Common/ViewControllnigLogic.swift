//
//  ViewControllnigLogic.swift
//  SummerBagFinder
//
//  Created by 정국희 on 2020/07/01.
//  Copyright © 2020 EUIGYOM KIM. All rights reserved.
//

import UIKit
import SwiftUI

protocol ViewControllingLogic {
    func display(_ destination: ViewControllingLogic)
}

#warning("이상함")
extension ViewControllingLogic {
    func display(_ destination: ViewControllingLogic) {}
}

extension ViewControllingLogic where Self: UIViewController {
    
    func display(_ destination: ViewControllingLogic) {
        if let destination = destination as? UIViewController {
            show(destination, sender: nil)
        }
    }
}

extension UIViewController: ViewControllingLogic {}
