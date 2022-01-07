//
//  TextResponse.swift
//  Jat111
//
//  Created by Денис Андриевский on 07.01.2022.
//

import Foundation

struct TextResponse: Decodable {
    let data: String
}

struct TextErrorsResponse: Decodable {
    let errors: [TextErrorResponse]
}

struct TextErrorResponse: Decodable {
    let message: String
}
