//
//  OccurenceTVC.swift
//  Jat111
//
//  Created by Денис Андриевский on 07.01.2022.
//

import UIKit

final class OccurenceTVC: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet private var titleLabel: UILabel!
}

extension OccurenceTVC {
    private func setup() {
        titleLabel.textColor = Color.black
        titleLabel.font = Font.title
    }
    
    func update(occurence: MainPresenter.Occurence) {
        titleLabel.text = String(format: C.occurenceTitle, occurence.char, occurence.count)
    }
}
