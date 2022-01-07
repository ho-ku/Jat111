//
//  AuthVC.swift
//  Jat111
//
//  Created by Денис Андриевский on 07.01.2022.
//

import UIKit

final class AuthVC: UIViewController {
    
    enum ValidationError: Error {
        case emailInvalid
        case emptyFields
    }
    
    enum AuthState {
        case signUp, logIn
        
        mutating func toggle() {
            switch self {
            case .signUp:
                self = .logIn
            case .logIn:
                self = .signUp
            }
        }
    }
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var mainView: AuthVCView!
    
    // MARK: - Properties
    
    var presenter: AuthPresenter!
    private var state: AuthState = .signUp
    
}

extension AuthVC {
    private func toggleState() {
        state.toggle()
        mainView.update(state: state)
    }
}

// MARK: - IBActions

extension AuthVC {
    @IBAction private func changeState(_ sender: UIButton) {
        toggleState()
    }
    
    @IBAction private func proceed(_ sender: JTButton) {
        let viewData = mainView.viewData
        
        do {
            try validateViewData()
            
            Task {
                switch state {
                case .signUp:
                    await presenter.signUp(email: viewData.email,
                                     password: viewData.password,
                                     name: viewData.name)
                case .logIn:
                   await presenter.logIn(email: viewData.email, password:
                                        viewData.password)
                }
            }
        } catch {
            showOkAlert(title: error.localizedDescription)
        }
    }
}

// MARK: - ViewPresentable

extension AuthVC: ViewPresentable {
    func update<T>(with data: T) {
        if let authError = data as? AuthError {
            DispatchQueue.main.async { [weak self] in
                self?.showOkAlert(title: authError.title)
            }
        }
    }
}

private extension AuthVCView.ViewData {
    func isEmpty(state: AuthVC.AuthState) -> Bool {
        switch state {
        case .logIn:
            return email.isEmpty || password.isEmpty
        case .signUp:
            return email.isEmpty || password.isEmpty || name.isEmpty
        }
    }
}

extension AuthVC {
    func validateViewData() throws {
        let viewData = mainView.viewData
        guard viewData.email.emailValid else { throw ValidationError.emailInvalid }
        guard !viewData.isEmpty(state: state) else { throw ValidationError.emptyFields }
    }
}
