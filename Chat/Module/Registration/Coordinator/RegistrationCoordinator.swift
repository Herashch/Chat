//
//  RegistrationCoordinator.swift
//  Chat
//
//  Created by Ivan Herashchenko on 19.03.2021.
//

import UIKit

protocol RegistrationCoordinatorProtocol {
    func toHome()
    func start()
}

final class RegistrationCoordinator {
    
    // MARK: - Private properties
    
    private var navigation: BaseNavigationVC!
    
    // MARK: - Inits
    
    init(navigation: BaseNavigationVC) {
        self.navigation = navigation
    }
}

// MARK: - RegistrationCoordinatorProtocol

extension RegistrationCoordinator: RegistrationCoordinatorProtocol {
    func toHome() {
        let coordinator = HomeCoordinator()
        let view = coordinator.start()
        view.modalPresentationStyle = .fullScreen
        navigation.present(view, animated: true, completion: nil)
    }
    
    func start() {
        let viewController = RegistrationViewController.createFromStoryboard()
        let viewModel = RegistrationViewModel(coordinator: self, view: viewController)
        viewController.viewModel = viewModel
        navigation.pushViewController(viewController)
    }
}

