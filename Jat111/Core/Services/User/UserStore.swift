//
//  UserStore.swift
//  Jat111
//
//  Created by Денис Андриевский on 07.01.2022.
//

import Foundation

protocol UserStore {
    var authToken: String { get }
    func update(token: String)
}

final class UserStoreImpl: UserStore {
    
    // MARK: - Properties
    
    var authToken: String {
        defaults.value(forKey: Key.authToken) as? String ?? ""
    }
    private let defaults: UserDefaults
    
    // MARK: - Init
    
    init() {
        defaults = .standard
    }
    
}

extension UserStoreImpl {
    func update(token: String) {
        defaults.set(token, forKey: Key.authToken)
    }
}

private extension UserStoreImpl {
    struct Key {
        static let authToken = "authToken"
    }
}
