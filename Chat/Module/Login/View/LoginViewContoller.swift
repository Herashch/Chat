//
//  LoginViewContoller.swift
//  Chat
//
//  Created by Ivan Herashchenko on 15.03.2021.
//

import UIKit

protocol LoginViewControllerProtocol {
    func showAlert()
}

final class LoginViewController: UIViewController, StoryboardCreatable {
    
    // MARK: - Outlets
    
    @IBOutlet weak private var emailTextField: UITextField!
    @IBOutlet weak private var passwordTextField: UITextField!
    
    // MARK: - Public properties
    
    var viewModel: LoginViewModelProtocol!
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Actions
    
    @IBAction func login() {
        viewModel.updateEntity(emailTextField.text ?? "", passwordTextField.text ?? "")
        viewModel.toHome.perform()
    }
}

// MARK: - Private methods

private extension LoginViewController {
    func setupView() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

// MARK: - LoginViewControllerProtocol

extension LoginViewController: LoginViewControllerProtocol {
    func showAlert() {
        let alert = UIAlertController(title: "Error", message: "You entered incorrect data", preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            alert.dismiss(animated: true, completion: nil)
        }
    }
}
