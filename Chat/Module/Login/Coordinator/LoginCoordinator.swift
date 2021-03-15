//
//  LoginCoordinator.swift
//  Chat
//
//  Created by Ivan Herashchenko on 15.03.2021.
//

import UIKit

protocol LoginCoordinatorProtocol {
    func close()
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
    func close() {
        navigation.popViewController(animated: true)
    }
    
    func toHome() {
        
    }
    
    func start() {
        let controller = LoginViewController.createFromStoryboard()
        let viewModel = LoginViewModel(coordinator: self, view: controller)
        controller.viewModel = viewModel
        navigation.pushViewController(controller)
    }
}
