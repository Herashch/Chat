//
//  LoginCoordinator.swift
//  Chat
//
//  Created by Ivan Herashchenko on 15.03.2021.
//

import UIKit

protocol LoginCoordinatorProtocol {
    func toHome()
    func start()
}

final class LoginCoordinator {
    
    // MARK: - Private properties
    
    private let navigation: BaseNavigationVC
    
    // MARK: - Inits
    
    init(navigation: BaseNavigationVC) {
        self.navigation = navigation
    }
}

// MARK: - LoginCoordinatorProtocol

extension LoginCoordinator: LoginCoordinatorProtocol {
    func toHome() {
        let coordinator = HomeCoordinator()
        coordinator.start()
    }
    
    func start() {
        let controller = LoginViewController.createFromStoryboard()
        let viewModel = LoginViewModel(coordinator: self, view: controller)
        controller.viewModel = viewModel
        navigation.pushViewController(controller)
    }
}
