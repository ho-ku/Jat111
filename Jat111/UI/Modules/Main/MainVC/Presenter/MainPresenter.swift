//
//  MainPresenter.swift
//  Jat111
//
//  Created by Денис Андриевский on 07.01.2022.
//

import Foundation

final class MainPresenter {
    
    // MARK: - Properties
    
    weak var view: ViewPresentable?
    private let textService: TextService
    private let userStore: UserStore
    
    // MARK: - Init
    
    init(view: ViewPresentable) {
        self.view = view
        self.textService = Dependency.textService
        self.userStore = Dependency.userStore
    }
}

extension MainPresenter {
    func getText() async {
        let result = await textService.getText(token: userStore.authToken)
        map(result: result)
    }
}

extension MainPresenter {
    private func map(result: TextResult) {
        switch result {
        case .success(let textResponse):
            view?.update(with: textResponse.data)
        case .error(let authError):
            view?.update(with: authError)
        }
    }
}
