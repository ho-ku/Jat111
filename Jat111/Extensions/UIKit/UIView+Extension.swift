//
//  UIView+Extension.swift
//  Jat111
//
//  Created by Денис Андриевский on 07.01.2022.
//

import UIKit

extension UIView {
    func addDefaultCornerRadius() {
        layer.cornerRadius = 8
        clipsToBounds = true
    }
}

extension UIView {
    func addDefaultBorder() {
        layer.borderWidth = 1
        layer.borderColor = Color.gray.cgColor
    }
}
