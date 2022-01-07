//
//  ViewPresentable.swift
//  Jat111
//
//  Created by Денис Андриевский on 07.01.2022.
//

import Foundation

protocol ViewPresentable: AnyObject {
    func update<T>(with data: T)
    func updateWithSuccess()
}
