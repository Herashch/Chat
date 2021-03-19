//
//  RegistrationViewModel.swift
//  Chat
//
//  Created by Ivan Herashchenko on 19.03.2021.
//

import Foundation
import Firebase

protocol RegistrationViewModelProtocol {
    func updateEntity(_ email: String, _ password: String)
    var toHome: Command { get }
}

final class RegistrationViewModel: RegistrationViewModelProtocol {
    
    // MARK: - Private properties
    
    private var entity: LoginAndRegisterModel = .initial
    private let coordinator: RegistrationCoordinatorProtocol!
    private let view: RegistrationViewControllerProtocol!
    
    // MARK: - Inits 
    
    init(coordinator: RegistrationCoordinatorProtocol, view: RegistrationViewControllerProtocol) {
        self.coordinator = coordinator
        self.view = view
    }
    
    // MARK: - RegistrationViewModelProtocol
    
    lazy var toHome: Command = {
        return .init { [unowned self] in
            self.register()
        }
    }()
    
    func updateEntity(_ email: String, _ password: String) {
        entity = entity.updateEmailAndPassword(email, password)
    }
    
}

// MARK: - Private methods

private extension RegistrationViewModel {
    func register() {
        Auth.auth().createUser(withEmail: entity.email, password: entity.password) { authResult, error in
            if let e = error {
                self.view.showAlert()
            } else {
                self.coordinator.toHome()
            }
        }
    }
}
