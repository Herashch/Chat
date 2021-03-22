//
//  AddChatViewController.swift
//  Chat
//
//  Created by Ivan Herashchenko on 19.03.2021.
//

import UIKit

protocol AddChatViewControllerProtocol {
    func showAlert(text: String)
}

final class AddChatViewController: UIViewController, StoryboardCreatable {
    
    // MARK: - Outlets
    
    @IBOutlet weak private var nameTextField: UITextField!
    @IBOutlet weak private var emailTextField: UITextField!
    
    // MARK: - Public properties
    
    var viewModel: AddChatViewModelProtocol!
    
    // MARK: - Life cycle 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
    }
}

// MARK: - Private properties

private extension AddChatViewController {
    
    @objc func addChat() {
        viewModel.findUser(name: nameTextField.text ?? "", email: emailTextField.text ?? "")
    }
    
    @objc func cancel() {
        viewModel.cancel.perform()
    }
    
    func setupNavigation() {
        title = "Add Chat"
        navigationController?.navigationBar.backgroundColor = UIColor.white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addChat))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancel))
    }
}

// MARK: - AddChatViewControllerProtocol

extension AddChatViewController: AddChatViewControllerProtocol {
    func showAlert(text: String) {
        let alert = UIAlertController(title: "Error", message: text, preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            alert.dismiss(animated: true, completion: nil)
        }
    }
}
