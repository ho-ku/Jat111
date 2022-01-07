//
//  AuthVCView.swift
//  Jat111
//
//  Created by Денис Андриевский on 07.01.2022.
//

import UIKit

final class AuthVCView: UIView {
    
    struct ViewData {
        let email: String
        let password: String
        let name: String
    }
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var emailTextField: JTTextField!
    @IBOutlet private weak var passwordTextField: JTTextField!
    @IBOutlet private weak var nameTextField: JTTextField!
    @IBOutlet private weak var proceedButton: JTButton!
    @IBOutlet private weak var changeStateButton: UIButton!
    
    // MARK: - Properties
    
    var viewData: ViewData {
        .init(email: emailTextField.text ?? "",
              password: passwordTextField.text ?? "",
              name: nameTextField.text ?? "")
    }
}

extension AuthVCView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
}

extension AuthVCView {
    private func setup() {
        titleLabel.font = Font.headline
        titleLabel.textColor = Color.black
        titleLabel.text = C.welcome
        
        emailTextField.placeholder = C.emailPlaceholder
        passwordTextField.placeholder = C.passwordPlaceholder
        nameTextField.placeholder = C.namePlaceholder
        
        changeStateButton.titleLabel?.font = Font.smallText
        changeStateButton.setTitleColor(Color.purple, for: .normal)
        
        update(state: .signUp)
    }
}

extension AuthVCView {
    func update(state: AuthVC.AuthState) {
        switch state {
        case .logIn:
            nameTextField.isHidden = true
            
            proceedButton.setTitle(C.logIn, for: .normal)
            changeStateButton.setTitle(C.signUp, for: .normal)
        case .signUp:
            nameTextField.isHidden = false
            
            proceedButton.setTitle(C.signUp, for: .normal)
            changeStateButton.setTitle(C.logIn, for: .normal)
        }
    }
}
