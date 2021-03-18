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
        setupNavigation()
        setupTableView()
    }
    
    func setupNavigation() {
        title = "Chats"
        navigationController?.navigationBar.backgroundColor = UIColor.white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addChat))
    }
}

// MARK: - Private methods

private extension ChatListViewController {
    
    @objc func addChat() {
        
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ChatListCell", bundle: nil), forCellReuseIdentifier: "ChatListCellID")
        tableView.tableFooterView = UIView()
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.openChat.perform()
    }
}

// MARK: - ChatListViewControllerProtocol

extension ChatListViewController: ChatListViewControllerProtocol {
    
}
