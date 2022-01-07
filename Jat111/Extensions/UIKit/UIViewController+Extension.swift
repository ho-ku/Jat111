//
//  UIViewController+Extension.swift
//  Jat111
//
//  Created by Денис Андриевский on 07.01.2022.
//

import UIKit

extension UIViewController {
    static func instance(storyboardName storyboard: String? = nil, withName name: String? = nil) -> Self? {
        let storyboard = UIStoryboard(name: storyboard ?? String(describing: Self.self), bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: name ?? String(describing: Self.self)) as? Self
    }
}

extension UIViewController {
    func showOkAlert(title: String) {
        let alertController = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        alertController.addAction(.init(title: C.ok, style: .default, handler: nil))
        present(alertController, animated: true)
    }
}
