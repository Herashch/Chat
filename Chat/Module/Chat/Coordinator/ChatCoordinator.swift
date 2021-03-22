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
    private var chatID: String
    private var title: String
    
    // MARK: - Inits
    
    init(navigation: UINavigationController, chatID: String, title: String) {
        self.navigation = navigation
        self.chatID = chatID
        self.title = title
    }
}

// MARK: - ChatCoordinatorProtocol

extension ChatCoordinator: ChatCoordinatorProtocol {
    func start() {
        let viewController = ChatViewController.createFromStoryboard()
        let viewModel = ChatViewModel(coordinator: self, view: viewController, chatID: chatID, title: title)
        viewController.viewModel = viewModel
        viewController.hidesBottomBarWhenPushed = true
        navigation.pushViewController(viewController)
    }
}
