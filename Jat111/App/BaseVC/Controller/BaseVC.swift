//
//  BaseVC.swift
//  Jat111
//
//  Created by Денис Андриевский on 07.01.2022.
//

import UIKit

private extension Notification.Name {
    static let changeFlowAuth: Self = .init(rawValue: "changeFlowAuth")
    static let changeFlowMain: Self = .init(rawValue: "changeFlowMain")
}

extension UIViewController {
    enum Flow {
        case auth, main
    }
    
    func updateFlow(_ flow: Flow) {
        switch flow {
        case .auth:
            NotificationCenter.default.post(name: .changeFlowAuth, object: nil)
        case .main:
            NotificationCenter.default.post(name: .changeFlowMain, object: nil)
        }
    }
}

class BaseVC: UIViewController {

    // MARK: - Properties
    
    private let userStore: UserStore = Dependency.userStore
    private var authCoordinator: AuthCoordinator?
    private var mainCoordinator: MainCoordinator?
    private var flow: Flow = .auth { didSet { updateCoordinator() } }
}

// MARK: - Lifecycle

extension BaseVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupObservers()
        setupCoordinators()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateFlow()
    }
}

extension BaseVC {
    private func setupCoordinators() {
        authCoordinator = .init(presenter: self)
        mainCoordinator = .init(presenter: self)
    }
}

extension BaseVC {
    private func setupObservers() {
        NotificationCenter.default.addObserver(forName: .changeFlowAuth, object: nil, queue: nil) { [weak self] _ in
            self?.flow = .auth
        }
        NotificationCenter.default.addObserver(forName: .changeFlowMain, object: nil, queue: nil) { [weak self] _ in
            self?.flow = .main
        }
    }
}

extension BaseVC {
    private func updateFlow() {
        flow = userStore.authToken.isEmpty ? .auth : .main
    }
    
    private func updateCoordinator() {
        switch flow {
        case .auth:
            mainCoordinator?.stop()
            authCoordinator?.start()
        case .main:
            authCoordinator?.stop()
            mainCoordinator?.start()
        }
    }
}
