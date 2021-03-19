//
//  RegistrationViewController.swift
//  Chat
//
//  Created by Ivan Herashchenko on 19.03.2021.
//

import UIKit

protocol RegistrationViewControllerProtocol {
    func showAlert()
}

final class RegistrationViewController: UIViewController, StoryboardCreatable {
    
    // MARK: - Outlets
    
    @IBOutlet weak private var emailTextField: UITextField!
    @IBOutlet weak private var passwordTextField: UITextField!
    
    // MARK: - Public properties
    
    var viewModel: RegistrationViewModelProtocol!
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Actions
    
    @IBAction func register() {
        viewModel.updateEntity(emailTextField.text ?? "", passwordTextField.text ?? "")
        viewModel.toHome.perform()
    }
}

// MARK: - Private methods

private extension RegistrationViewController {
    func setupView() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

// MARK: - RegistrationViewControllerProtocol

extension RegistrationViewController: RegistrationViewControllerProtocol {
    func showAlert() {
        let alert = UIAlertController(title: "Error", message: "You entered incorrect data", preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            alert.dismiss(animated: true, completion: nil)
        }
    }
}
