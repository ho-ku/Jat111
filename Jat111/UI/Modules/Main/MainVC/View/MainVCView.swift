//
//  MainVCView.swift
//  Jat111
//
//  Created by Денис Андриевский on 07.01.2022.
//

import UIKit

final class MainVCView: UIView {

    // MARK: - IBOutlets
    
    @IBOutlet private weak var fetchButton: JTButton!

}

// MARK: - Lifecycle

extension MainVCView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
}

extension MainVCView {
    private func setup() {
        fetchButton.setTitle(C.fetch, for: .normal)
    }
}
