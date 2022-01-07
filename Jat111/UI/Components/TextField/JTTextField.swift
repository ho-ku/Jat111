//
//  JTTextField.swift
//  Jat111
//
//  Created by Денис Андриевский on 07.01.2022.
//

import UIKit

@IBDesignable
final class JTTextField: UITextField {
    
    // MARK: - Properties
    
    private let textInset: CGFloat = 10
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customize()
    }
    
    override func prepareForInterfaceBuilder() {
        customize()
    }
}

extension JTTextField {
    private func customize() {
        addDefaultCornerRadius()
        addDefaultBorder()
        font = Font.title
        textColor = Color.black
        
    }
}

extension JTTextField {
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.insetBy(dx: textInset, dy: textInset)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.insetBy(dx: textInset, dy: textInset)
    }
}
