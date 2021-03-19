//
//  AddChatCoordinator.swift
//  Chat
//
//  Created by Ivan Herashchenko on 19.03.2021.
//

import UIKit

protocol AddChatCoordinatorProtocol {
    func start()
}

final class AddChatCoordinator {
    
    // MARK: - Private properties
    
    private var navigation: UINavigationController!
    
    // MARK: - Inits 
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
}

// MARK: - AddChatCoordinatorProtocol

extension AddChatCoordinator: AddChatCoordinatorProtocol {
    func start() {
        let viewController = AddChatViewController.createFromStoryboard()
        let viewModel = AddChatViewModel(coordinator: self, view: viewController)
        viewController.viewModel = viewModel
        viewController.modalPresentationStyle = .pageSheet
        viewController.modalTransitionStyle = .coverVertical
        navigation.present(viewController, animated: true, completion: nil)
    }
}
