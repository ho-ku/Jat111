//
//  MainFactory.swift
//  Jat111
//
//  Created by Денис Андриевский on 07.01.2022.
//

import Foundation

enum MainFactoryError: Error {
    case instanceFailure
}

protocol MainFactory {
    func buildMainVC() throws -> MainVC
}

final class MainFactoryImpl: MainFactory {
    func buildMainVC() throws -> MainVC {
        guard let instance = MainVC.instance() else { throw MainFactoryError.instanceFailure }
//        let authPresenter = AuthPresenter(view: instance)
//        instance.presenter = authPresenter
        return instance
    }
}
