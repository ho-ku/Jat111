//
//  AuthResponse.swift
//  Jat111
//
//  Created by Денис Андриевский on 07.01.2022.
//

import Foundation

struct AuthResponse: Decodable {
    let data: AuthResponseData
}

struct AuthErrorsResponse: Decodable {
    let errors: [AuthErrorResponse]
}

struct AuthErrorResponse: Decodable {
    let message: String
}

struct AuthResponseData {
    let accessToken: String
}

extension AuthResponseData: Decodable {
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        accessToken = try container.decode(String.self, forKey: .accessToken)
    }
}
