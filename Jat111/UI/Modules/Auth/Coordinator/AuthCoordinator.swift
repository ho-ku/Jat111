//
//  AuthCoordinator.swift
//  Jat111
//
//  Created by Денис Андриевский on 07.01.2022.
//

import UIKit

final class AuthCoordinator {
    
    // MARK: - Properties
    
    private let presenter: UIViewController
    private let factory: AuthFactory
    private var authVC: AuthVC?
    
    // MARK: - Init
    
    init(presenter: UIViewController) {
        self.presenter = presenter
        self.factory = AuthFactoryImpl()
    }
    
}

extension AuthCoordinator: Coordinator {
    func start(animated: Bool = true) {
        authVC = try? factory.buildAuthVC()
        guard let vc = authVC else { return }
        presenter.present(vc, animated: animated)
    }
    
    func stop(animated: Bool = false) {
        authVC?.dismiss(animated: animated)
    }
}
