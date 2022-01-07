//
//  AuthPresenter.swift
//  Jat111
//
//  Created by Денис Андриевский on 07.01.2022.
//

import Foundation

final class AuthPresenter {
    
    // MARK: - Properties
    
    weak var view: ViewPresentable?
    private let authService: AuthService
    private let userStore: UserStore
    
    // MARK: - Init
    
    init(view: ViewPresentable) {
        self.view = view
        self.authService = Dependency.authService
        self.userStore = Dependency.userStore
    }
}

extension AuthPresenter {
    func logIn(email: String, password: String) async {
        let result = await authService.logIn(model: .init(email: email, password: password))
        map(result: result)
    }
    
    func signUp(email: String, password: String, name: String) async {
        let result = await authService.signUp(model: .init(name: name, email: email, password: password))
        map(result: result)
    }
}

extension AuthPresenter {
    private func map(result: AuthResult) {
        switch result {
        case .success(let authResponse):
            userStore.update(token: authResponse.data.accessToken)
            view?.updateWithSuccess()
        case .error(let authError):
            view?.update(with: authError)
        }
    }
}
