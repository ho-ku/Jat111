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
    
    // MARK: - Init
    
    init(view: ViewPresentable) {
        self.view = view
    }
}

extension AuthPresenter {
    func logIn(email: String, password: String) {
        
    }
    
    func signUp(email: String, password: String, name: String) {
        
    }
}
