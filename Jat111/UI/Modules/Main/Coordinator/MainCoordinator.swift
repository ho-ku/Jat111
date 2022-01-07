//
//  MainCoordinator.swift
//  Jat111
//
//  Created by Денис Андриевский on 07.01.2022.
//

import UIKit

final class MainCoordinator {
    
    // MARK: - Properties
    
    private let presenter: UIViewController
    private let factory: MainFactory
    private var mainVC: MainVC?
    
    // MARK: - Init
    
    init(presenter: UIViewController) {
        self.presenter = presenter
        self.factory = MainFactoryImpl()
    }
    
}

extension MainCoordinator: Coordinator {
    func start(animated: Bool = true) {
        mainVC = try? factory.buildMainVC()
        guard let vc = mainVC else { return }
        presenter.present(vc, animated: animated)
    }
    
    func stop(animated: Bool = false) {
        mainVC?.dismiss(animated: animated)
    }
}
