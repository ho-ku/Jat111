//
//  NetworkRequest.swift
//  Jat111
//
//  Created by Денис Андриевский on 07.01.2022.
//

import Foundation

struct NetworkRequest {
    
    enum RequestMethod: String {
        case GET, POST
    }
    
    struct RequestHeader {
        let key: String
        let value: String
    }
    
    let method: RequestMethod
    let url: URL
    let body: Data?
    let headers: [RequestHeader]
}
