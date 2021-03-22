//
//  AddChatCoordinator.swift
//  Chat
//
//  Created by Ivan Herashchenko on 19.03.2021.
//

import UIKit

protocol AddChatCoordinatorProtocol {
    func close()
    func start() -> UIViewController
}

final class AddChatCoordinator {
    // MARK: - Private properties
    private var navigation: UINavigationController!
}

// MARK: - AddChatCoordinatorProtocol

extension AddChatCoordinator: AddChatCoordinatorProtocol {
    
    func close() {
        navigation.dismiss(animated: true, completion: nil)
    }
    
    func start() -> UIViewController {
        let viewController = AddChatViewController.createFromStoryboard()
        let viewModel = AddChatViewModel(coordinator: self, view: viewController)
        viewController.viewModel = viewModel
        navigation = UINavigationController()
        navigation.viewControllers = [viewController]
        return navigation
    }
}
