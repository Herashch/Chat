//
//  ChatListViewController.swift
//  Chat
//
//  Created by Ivan Herashchenko on 16.03.2021.
//

import UIKit

protocol ChatListViewControllerProtocol {
    
}

final class ChatListViewController: UIViewController, StoryboardCreatable {
    
    // MARK: - Outlets
    
    @IBOutlet weak private var tableView: UITableView!
    
    // MARK: - Public properties
    
    var viewModel: ChatListViewModelProtocol!
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
}

// MARK: - Private methods

private extension ChatListViewController {
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ChatListCell", bundle: nil), forCellReuseIdentifier: "ChatListCellID")
        tableView.tableFooterView = UIView()
        self.navigationItem.largeTitleDisplayMode = .always
    }
}

// MARK: - UITableViewDataSource

extension ChatListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getElements().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatListCellID", for: indexPath) as! ChatListCell
        cell.configure(with: viewModel.getElements()[indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDelegate

extension ChatListViewController: UITableViewDelegate {
    
}

// MARK: - ChatListViewControllerProtocol

extension ChatListViewController: ChatListViewControllerProtocol {
    
}
