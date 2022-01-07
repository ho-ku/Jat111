//
//  NetworkResponse.swift
//  Jat111
//
//  Created by Денис Андриевский on 07.01.2022.
//

import Foundation

enum NetworkResponse {
    case success(NetworkSuccessResponse)
    case error(Error)
}

struct NetworkSuccessResponse {
    let response: HTTPURLResponse
    let data: Data
}
