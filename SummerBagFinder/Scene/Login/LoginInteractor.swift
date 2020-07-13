//
//  LoginInteractor.swift
//  SummerBagFinder
//
//  Created by EUIGYOM KIM on 2020/06/21.
//  Copyright (c) 2020 EUIGYOM KIM. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import Foundation

// MARK: LoginInteractor

final class LoginInteractor {
    var presenter: LoginPresentationLogic?
    var router: LoginRoutingLogic?
    private var worker: LoginWorkingLogic?
    
    init(worker: LoginWorkingLogic) {
        self.worker = worker
    }
}

extension LoginInteractor: LoginRequestLogic {
    func process(_ request: Login.Request.Login) {
        self.router?.routeToRegionList(message: "로그인화면에서 온 메시지")
//        worker?.processToLogin(id: request.id, password: request.password) { [weak self] result in
//            guard let self = self else { return }
//
//            switch result {
//            case let .success(isSuccess):
//                // 지역 선택 화면으로 이동
//                if isSuccess {
//                    self.router?.routeToRegionList(message: "로그인화면에서 온 메시지")
//                }
//                // 로그인 실패 얼럿 노출
//                else {
//                    self.presenter?.present(.error(BaseError.loginFailure))
//                }
//            case let .failure(error):
//                self.presenter?.present(.error(error))
//            }
//        }
    }
}

// MARK: protocol

protocol LoginRequestLogic {
    func process(_ request: Login.Request.Login)
}

protocol LoginWorkingLogic {
    func processToLogin(id: String?, password: String?, completion: @escaping (Result<Bool, BaseError>) -> ())
}

protocol LoginRoutingLogic {
    func routeToRegionList(message: String?)
}

protocol LoginPresentationLogic: class {
    func present(_ response: Login.Response)
}
