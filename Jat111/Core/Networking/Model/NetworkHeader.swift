//
//  NetworkHeader.swift
//  Jat111
//
//  Created by Денис Андриевский on 07.01.2022.
//

import Foundation

struct NetworkHeader {
    let key: String
    let value: String
}

extension NetworkHeader {
    static let contentType: Self = .init(key: "Content-Type", value: "application/json;charset=utf-8")
    static func auth(token: String) -> Self { .init(key: "Authorization", value: "Bearer \(token)") }
}
