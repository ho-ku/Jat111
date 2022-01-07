//
//  MainVC.swift
//  Jat111
//
//  Created by Денис Андриевский on 07.01.2022.
//

import UIKit

final class MainVC: UIViewController {
    
    // MARK: - Properties
    
    var presenter: MainPresenter!
}

extension MainVC: ViewPresentable {
    func updateWithSuccess() {}
    
    func update<T>(with data: T) {
        if let textError = data as? TextError {
            DispatchQueue.main.async { [weak self] in
                self?.showOkAlert(title: textError.title)
            }
        } else if let occurence = data as? [MainPresenter.Occurence] {
            // proceed occurence
        }
    }
}
