//
//  AuthVC.swift
//  Jat111
//
//  Created by Денис Андриевский on 07.01.2022.
//

import UIKit

final class AuthVC: UIViewController {
    
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
        
    }
}
