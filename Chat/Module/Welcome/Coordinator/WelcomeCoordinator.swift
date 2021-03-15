//
//  WelcomeCoordinator.swift
//  Chat
//
//  Created by Ivan Herashchenko on 15.03.2021.
//

import UIKit

protocol WelcomeCoordinatorProtocol {
    func configure() -> UIViewController
    func toLogin()
    func toRegister()
}

final class WelcomeCoordinator {
    private var navigation: BaseNavigationVC!
}

// MARK: - WelcomeCoordinatorProtocol

extension WelcomeCoordinator: WelcomeCoordinatorProtocol {
    func configure() -> UIViewController {
        let viewController = WelcomeViewController.createFromStoryboard()
        let viewModel = WelcomeViewModel(coordinator: self, view: viewController)
        viewController.viewModel = viewModel
        navigation = BaseNavigationVC(rootViewController: viewController)
        navigation.changeToBlack()
        return navigation
    }
    
    func toLogin() {
        let coordinator = LoginCoordinator(navigation: navigation)
        coordinator.start()
    }
    
    func toRegister() {
        
    }
}
