//
//  ChatListCoordinator.swift
//  Chat
//
//  Created by Ivan Herashchenko on 16.03.2021.
//

import UIKit

protocol ChatListCoordinatorProtocol {
    func start() -> UIViewController
}


final class ChatListCoordinator {
    // MARK: - Private properties
    private var navigation: UINavigationController!
}

// MARK: - ChatListCoordinatorProtocol

extension ChatListCoordinator: ChatListCoordinatorProtocol {
    func start() -> UIViewController {
        let viewController = ChatListViewController.createFromStoryboard()
        let viewModel = ChatListViewModel(coordinator: self, view: viewController)
        viewController.viewModel = viewModel
        navigation = UINavigationController()
        navigation.viewControllers = [viewController]
        return navigation
    }
}
