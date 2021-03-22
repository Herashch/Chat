//
//  ChatListCoordinator.swift
//  Chat
//
//  Created by Ivan Herashchenko on 16.03.2021.
//

import UIKit

protocol ChatListCoordinatorProtocol {
    func start() -> UIViewController
    func toAddChat()
    func toChat(id: String, title: String)
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
    
    func toAddChat() {
        let coordinator = AddChatCoordinator()
        let view = coordinator.start()
        navigation.present(view, animated: true, completion: nil)
    }
    
    func toChat(id: String, title: String) {
        let coordinator = ChatCoordinator(navigation: navigation, chatID: id, title: title)
        coordinator.start()
    }
}
