//
//  UITableView+Extension.swift
//  Jat111
//
//  Created by Денис Андриевский on 07.01.2022.
//

import UIKit

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>(withClass clazz: T.Type) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: clazz.reuseIdentifier) as? T else {
            fatalError("Error: cell with identifier: \(clazz.reuseIdentifier)) is not \(T.self)")
        }
        return cell
    }
}

private extension UITableViewCell {
    class var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}
