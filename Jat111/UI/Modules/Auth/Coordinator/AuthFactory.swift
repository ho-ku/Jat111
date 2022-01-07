//
//  AuthFactory.swift
//  Jat111
//
//  Created by Денис Андриевский on 07.01.2022.
//

import UIKit

enum AuthFactoryError: Error {
    case instanceFailure
}

protocol AuthFactory {
    func buildAuthVC() throws -> AuthVC
}

final class AuthFactoryImpl: AuthFactory {
    func buildAuthVC() throws -> AuthVC {
        guard let instance = AuthVC.instance() else { throw AuthFactoryError.instanceFailure }
        let authPresenter = AuthPresenter(view: instance)
        instance.presenter = authPresenter
        return instance
    }
}
