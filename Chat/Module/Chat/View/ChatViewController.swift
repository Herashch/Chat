//
//  ChatViewController.swift
//  Chat
//
//  Created by Ivan Herashchenko on 17.03.2021.
//

import UIKit

protocol ChatViewControllerProtocol {
    func refresh()
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
        title = viewModel.getTitle()
    }
    
    // MARK: - Actions
    
    @IBAction func sendMessage() {
        if textView.text != "" {
            viewModel.sendMessage(text: textView.text)
            textView.text = ""
        }
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
        return viewModel.getElements().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatViewCellID", for: indexPath) as! ChatViewCell
        cell.configure(with: viewModel.getElements()[indexPath.row])
        
        if viewModel.getElements()[indexPath.row].userID == viewModel.getUserID() {
            cell.leftImage.isHidden = true
            cell.rightImage.isHidden = false
        } else {
            cell.leftImage.isHidden = false
            cell.rightImage.isHidden = true
        }
        
        return cell
    }
}

extension ChatViewController: ChatViewControllerProtocol {
    func refresh() {
        tableView.reloadData()
        if viewModel.getElements().count > 0 {
            let indexPath = IndexPath(row: viewModel.getElements().count - 1, section: 0)
            self.tableView.scrollToRow(at: indexPath, at: .top, animated: false)
        }
    }
}
