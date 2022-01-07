//
//  Codable+Extension.swift
//  Jat111
//
//  Created by Денис Андриевский on 07.01.2022.
//

import Foundation

extension Encodable {
    var data: Data? {
        try? JSONEncoder().encode(self)
    }
}

extension Data {
    func decoded<T: Decodable>(into type: T.Type) -> T? {
        try? JSONDecoder().decode(type, from: self)
    }
}
