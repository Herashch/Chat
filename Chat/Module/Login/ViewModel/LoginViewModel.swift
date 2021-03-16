//
//  LoginViewModel.swift
//  Chat
//
//  Created by Ivan Herashchenko on 15.03.2021.
//

import Foundation
import Firebase

protocol LoginViewModelProtocol where Self: AnyObject {
    func updateEntity(_ email: String, _ password: String)
    var toHome: Command { get }
}

final class LoginViewModel: LoginViewModelProtocol {
    
    // MARK: - Private properties
    
    private var entity: LoginModel = .initial
    private let view: LoginViewControllerProtocol!
    private let coordinator: LoginCoordinatorProtocol!
    
    // MARK: - Inits
    
    init(coordinator: LoginCoordinatorProtocol, view: LoginViewControllerProtocol) {
        self.coordinator = coordinator
        self.view = view
    }
    
    // MARK: - LoginViewModelProtocol
    
    lazy var toHome: Command = {
        return .init { [unowned self] in
            self.login()
        }
    }()
    
    func updateEntity(_ email: String, _ password: String) {
        entity = entity.updateEmailAndPassword(email, password)
    }
    
}

// MARK: - Private methods

private extension LoginViewModel {
    func login() {
        Auth.auth().signIn(withEmail: entity.email, password: entity.password) { authResult, error in
            if error != nil {
                self.view.showAlert()
            } else {
                self.coordinator.toHome()
            }
        }
    }
}
