//
//  String+Extension.swift
//  Jat111
//
//  Created by Денис Андриевский on 07.01.2022.
//

import Foundation

extension String {
    var emailValid: Bool {
        // TODO: - improve validation
        self.contains("@") && self.contains(".")
    }
}
