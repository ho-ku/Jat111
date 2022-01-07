//
//  Dependency.swift
//  Jat111
//
//  Created by Денис Андриевский on 07.01.2022.
//

import Foundation

struct Dependency {

    // MARK: - Services
    
    static let network: Network = .init()
    static let authService: AuthService = AuthServiceImpl()
}
