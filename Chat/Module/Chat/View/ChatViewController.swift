//
//  ChatViewController.swift
//  Chat
//
//  Created by Ivan Herashchenko on 17.03.2021.
//

import UIKit

protocol ChatViewControllerProtocol {
    
}

final class ChatViewController: UIViewController, StoryboardCreatable {
    
    // MARK: - Outlets
    
    @IBOutlet weak private var tableView: UITableView!
    @IBOutlet weak private var textView: UITextView!
    @IBOutlet weak private var sendButton: UIButton!
    
    // MARK: - Public properties
    
    var viewModel: ChatViewModelProtocol!
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        title = "Title1"
    }
    
}

// MARK: - Private methods

private extension ChatViewController {
    func setupTableView() {
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ChatViewCell", bundle: nil), forCellReuseIdentifier: "ChatViewCellID")
        tableView.separatorStyle = .none
    }
}

// MARK: - UITableViewDataSource

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatViewCellID", for: indexPath) as! ChatViewCell
        cell.configure()
        return cell
    }
}

extension ChatViewController: ChatViewControllerProtocol {
    
}
