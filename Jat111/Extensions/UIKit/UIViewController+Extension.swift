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
