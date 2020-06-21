//
//  LoginFormView.swift
//  SummerBagFinder
//
//  Created by EUIGYOM KIM on 2020/06/21.
//  Copyright © 2020 EUIGYOM KIM. All rights reserved.
//

import UIKit
import SnapKit

class LoginFormView: BaseView {
    typealias Handler = (String) -> ()
    
    lazy private var label: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy private var textField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        return textField
    }()
    
    lazy private var divider: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray3
        
        view.snp.makeConstraints { (maker) in
            maker.height.equalTo(1)
        }
        
        return view
    }()
    
    var name: String = "" {
        didSet { setNeedsLayout() }
    }
    
    var isSecured: Bool = false {
        didSet { textField.isSecureTextEntry = isSecured }
    }
    
    var currentValue: String? {
        get { textField.text }
        set { textField.text = newValue }
    }
    
    var handler: Handler?
    
    override func initializeLayout() {
        setupViews()
    }
    
    override func initializeProperties() {
        
    }
    
    override func updateLayout() {
        label.text = name
    }
}

extension LoginFormView {
    private func setupViews() {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(textField)
        stackView.addArrangedSubview(divider)
        
        self.addSubview(stackView)
        
        stackView.snp.makeConstraints { (maker) in
            maker.edges.equalToSuperview()
        }
    }
}

extension LoginFormView {
    private func updateViews() {
        
    }
}
