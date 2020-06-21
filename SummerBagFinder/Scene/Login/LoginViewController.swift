//
//  LoginViewController.swift
//  SummerBagFinder
//
//  Created by EUIGYOM KIM on 2020/06/21.
//  Copyright (c) 2020 EUIGYOM KIM. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import RxSwift
import RxCocoa

protocol LoginDisplayLogic: class {
    func displayLoginFailureAlert()
}

class LoginViewController: UIViewController {
    var interactor: LoginBusinessLogic?
    let disposeBag = DisposeBag()
    
    lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 10
        return view
    }()
    
    lazy var idFormView: LoginFormView = {
        let view = LoginFormView()
        view.name = "아이디"
        return view
    }()
    
    lazy var passwordFormView: LoginFormView = {
        let view = LoginFormView()
        view.name = "패스워드"
        view.isSecured = true
        return view
    }()
    
    lazy var submitButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("로그인", for: .normal)
        button.backgroundColor = .systemBlue
        
        button.rx.tap.subscribe(onNext: {
            self.tapSubmitButton()
        }).disposed(by: disposeBag)
        
        return button
    }()
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

// MARK: - Setup

extension LoginViewController {
    private func setup() {
        let viewController = self
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        let router = LoginRouter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        interactor.router = router
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    private func setupViews() {
        self.title = "로그인"
        self.edgesForExtendedLayout = [.all]
        
        view.backgroundColor = .systemBackground
        view.addSubview(stackView)
        
        stackView.snp.makeConstraints { (maker) in
            maker.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            maker.leading.equalToSuperview().offset(20)
            maker.trailing.equalToSuperview().inset(20)
        }
        
        stackView.addArrangedSubview(idFormView)
        stackView.addArrangedSubview(passwordFormView)
        stackView.addArrangedSubview(submitButton)
    }
}

// MARK: - Actions

extension LoginViewController {
    private func tapSubmitButton() {
        guard let id = idFormView.currentValue, let password = passwordFormView.currentValue else { return }
        interactor?.doLogin(request: Login.LoginTrial.Request(id: id, password: password))
    }
}

// MARK: - Display Something

extension LoginViewController: LoginDisplayLogic {
    func displayLoginFailureAlert() {
        let alert = UIAlertController(title: "알림",
                                      message: "로그인에 실패했습니다.\n아이디와 패스워드를 다시 확인해 주세요.",
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "확인", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
