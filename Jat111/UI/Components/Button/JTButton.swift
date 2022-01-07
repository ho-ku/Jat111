//
//  JTButton.swift
//  Jat111
//
//  Created by Денис Андриевский on 07.01.2022.
//

import UIKit

@IBDesignable
final class JTButton: UIButton {
    
    // MARK: - Properties
    
    @IBInspectable var color: UIColor = Color.purple
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customize()
    }
    
    override func prepareForInterfaceBuilder() {
        customize()
    }
}

extension JTButton {
    private func customize() {
        backgroundColor = color
        setTitleColor(Color.white, for: .normal)
        titleLabel?.font = Font.mediumText
        addDefaultCornerRadius()
    }
}
