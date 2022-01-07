//
//  Font.swift
//  Jat111
//
//  Created by Денис Андриевский on 07.01.2022.
//

import UIKit

struct Font {
    static func font(weight: UIFont.Weight, size: CGFloat) -> UIFont {
        UIFont.systemFont(ofSize: size, weight: weight)
    }
}

// Typography

extension Font {
    static let headline = font(weight: .bold, size: 20)
    static let title = font(weight: .regular, size: 14)
    static let smallText = font(weight: .regular, size: 12)
    static let mediumText = font(weight: .medium, size: 14)
}
