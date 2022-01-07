//
//  Network.swift
//  Jat111
//
//  Created by Денис Андриевский on 07.01.2022.
//

import Foundation

final class Network {
    
    enum Error: Swift.Error {
        case dataNotFound
    }
    
    // MARK: - Properties
    
    private let session: URLSession
    
    // MARK: - Init
    
    init() {
        session = .shared
    }
}

extension Network {
    private func execute(request: NetworkRequest) async -> NetworkResponse {
        await withCheckedContinuation({ (continuation: CheckedContinuation<NetworkResponse, Never>) in
            session.dataTask(with: request.urlRequest) { data, response, error in
                if let error = error {
                    continuation.resume(returning: .error(error))
                    return
                }
                guard let data = data, let response = response as? HTTPURLResponse else {
                    continuation.resume(returning: .error(Error.dataNotFound))
                    return
                }
                continuation.resume(returning: .success(.init(response: response, data: data)))
            }.resume()
        })
    }
}

extension Network {
    func get(url: URL, headers: [NetworkHeader]) async -> NetworkResponse {
        let request = NetworkRequest(method: .GET, url: url, body: nil, headers: headers.map { .init(key: $0.key, value: $0.value) })
        return await execute(request: request)
    }
    
    func post(url: URL, body: Data, headers: [NetworkHeader]) async -> NetworkResponse {
        let request = NetworkRequest(method: .POST, url: url, body: body, headers: headers.map { .init(key: $0.key, value: $0.value) })
        return await execute(request: request)
    }
}

private extension NetworkRequest {
    var urlRequest: URLRequest {
        var req = URLRequest(url: url)
        req.httpBody = body
        req.httpMethod = method.rawValue
        headers.forEach { req.addValue($0.value, forHTTPHeaderField: $0.key) }
        req.addValue(NetworkHeader.contentType.value, forHTTPHeaderField: NetworkHeader.contentType.key)
        return req
    }
}
