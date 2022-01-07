//
//  MainVC.swift
//  Jat111
//
//  Created by Денис Андриевский on 07.01.2022.
//

import UIKit

final class MainVC: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var mainView: MainVCView!
    
    // MARK: - Properties
    
    private var occurences: [MainPresenter.Occurence] = []
    var presenter: MainPresenter!
}

// MARK: - Lifecycle

extension MainVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.tableViewDelegate = self
    }
}

// MARK: - UITableViewDelegate

extension MainVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 40 }
}

// MARK: - UITableViewDataSource

extension MainVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        occurences.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withClass: OccurenceTVC.self)
        cell.update(occurence: occurences[indexPath.row])
        return cell
    }
}

// MARK: - IBAction

extension MainVC {
    @IBAction private func fetchText(_ sender: JTButton) {
        Task {
            await presenter.getText()
        }
    }
}

// MARK: - ViewPresentable

extension MainVC: ViewPresentable {
    func updateWithSuccess() {}
    
    func update<T>(with data: T) {
        DispatchQueue.main.async { [weak self] in
            if let textError = data as? TextError {
                self?.showOkAlert(title: textError.title)
            } else if let occurence = data as? [MainPresenter.Occurence] {
                self?.occurences = occurence
                self?.mainView.reloadData()
            }
        }
    }
}
