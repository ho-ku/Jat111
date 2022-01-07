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
    
    // MARK: - Init
    
    init(presenter: UIViewController) {
        self.presenter = presenter
        self.factory = AuthFactoryImpl()
    }
    
}

extension AuthCoordinator: Coordinator {
    func start(animated: Bool = true) {
        guard let vc = try? factory.buildAuthVC() else { return }
        presenter.present(vc, animated: animated)
    }
}
