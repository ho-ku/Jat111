//
//  AuthService.swift
//  Jat111
//
//  Created by Денис Андриевский on 07.01.2022.
//

import Foundation

enum AuthResult {
    case success(AuthResponse)
    case error(AuthError)
}

struct AuthError {
    let title: String
}

protocol AuthService {
    func logIn(model: LogIn) async -> AuthResult
    func signUp(model: SignUp) async -> AuthResult
}

final class AuthServiceImpl {
    
    // MARK: - Properties
    
    private let network: Network
    
    // MARK: - Init
    
    init() {
        network = Dependency.network
    }
    
}

extension AuthServiceImpl: AuthService {
    func logIn(model: LogIn) async -> AuthResult {
        guard let url = URL(string: C.baseURL + Path.login),
              let data = model.data else { return .error(AuthError(title: "URL error")) }
        let result = await network.post(url: url, body: data, headers: [])
        switch result {
        case .success(let networkSuccessResponse):
            guard let successResponse = networkSuccessResponse.data.decoded(into: AuthResponse.self) else {
                if let errorResponse = networkSuccessResponse.data.decoded(into: AuthErrorsResponse.self) {
                    return .error(.init(title: errorResponse.errors.first?.message ?? ""))
                }
                return .error(.init(title: "Decoding error"))
            }
            
            return .success(.init(data: .init(accessToken: successResponse.data.accessToken)))
        case .error(let error):
            return .error(.init(title: error.localizedDescription))
        }
    }
    
    func signUp(model: SignUp) async -> AuthResult {
        guard let url = URL(string: C.baseURL + Path.signup),
              let data = model.data else { return .error(AuthError(title: "URL error")) }
        let result = await network.post(url: url, body: data, headers: [])
        switch result {
        case .success(let networkSuccessResponse):
            guard let successResponse = networkSuccessResponse.data.decoded(into: AuthResponse.self) else {
                if let errorResponse = networkSuccessResponse.data.decoded(into: AuthErrorsResponse.self) {
                    return .error(.init(title: errorResponse.errors.first?.message ?? ""))
                }
                return .error(.init(title: "Decoding error"))
            }
            
            return .success(.init(data: .init(accessToken: successResponse.data.accessToken)))
        case .error(let error):
            return .error(.init(title: error.localizedDescription))
        }
    }
}

private extension AuthServiceImpl {
    struct Path {
        static let signup = "/api/signup/"
        static let login = "/api/login/"
    }
}
