//
//  TextService.swift
//  Jat111
//
//  Created by Денис Андриевский on 07.01.2022.
//

import Foundation

enum TextResult {
    case success(TextResponse)
    case error(TextError)
}

struct TextError {
    let title: String
}

protocol TextService {
    func getText(token: String) async -> TextResult
}

final class TextServiceImpl {
    
    // MARK: - Properties
    
    private let network: Network
    
    // MARK: - Init
    
    init() {
        network = Dependency.network
    }
    
}

extension TextServiceImpl: TextService {
    func getText(token: String) async -> TextResult {
        guard let url = URL(string: C.baseURL + Path.text) else { return .error(TextError(title: "URL error")) }
        let result = await network.get(url: url, headers: [.auth(token: token)])
        switch result {
        case .success(let networkSuccessResponse):
            guard let successResponse = networkSuccessResponse.data.decoded(into: TextResponse.self) else {
                if let errorResponse = networkSuccessResponse.data.decoded(into: TextErrorsResponse.self) {
                    return .error(.init(title: errorResponse.errors.first?.message ?? ""))
                }
                return .error(.init(title: "Decoding error"))
            }
            
            return .success(.init(data: successResponse.data))
        case .error(let error):
            return .error(.init(title: error.localizedDescription))
        }
    }
}

private extension TextServiceImpl {
    struct Path {
        static let text = "/api/get/text/"
    }
}
