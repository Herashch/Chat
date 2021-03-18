//
//  ChatCoordinator.swift
//  Chat
//
//  Created by Ivan Herashchenko on 17.03.2021.
//

import UIKit

protocol ChatCoordinatorProtocol {
    func start()
}

final class ChatCoordinator {
    
    // MARK: - Private properties
    
    private var navigation: UINavigationController!
    
    // MARK: - Inits
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
}

// MARK: - ChatCoordinatorProtocol

extension ChatCoordinator: ChatCoordinatorProtocol {
    func start() {
        let viewController = ChatViewController.createFromStoryboard()
        let viewModel = ChatViewModel(coordinator: self, view: viewController)
        viewController.viewModel = viewModel
        viewController.hidesBottomBarWhenPushed = true
        navigation.pushViewController(viewController)
    }
}
