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
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    
    var tableViewDelegate: (UITableViewDelegate & UITableViewDataSource)? {
        didSet {
            tableView.delegate = tableViewDelegate
            tableView.dataSource = tableViewDelegate
        }
    }

}

// MARK: - Lifecycle

extension MainVCView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
}

extension MainVCView {
    func reloadData() {
        tableView.reloadData()
    }
}

extension MainVCView {
    private func setup() {
        fetchButton.setTitle(C.fetch, for: .normal)
    }
}
