//
//  HomeCoordinator.swift
//  Chat
//
//  Created by Ivan Herashchenko on 16.03.2021.
//

import Foundation

protocol HomeCoordinatorProtocol {
    func start()
}

final class HomeCoordinator {
    private var navigation: BaseNavigationVC!
}

// MARK: - HomeCordinatorProtocol

extension HomeCoordinator: HomeCoordinatorProtocol {
    func start() {
        let controller = HomeViewController.createFromStoryboard()
        let viewModel = HomeViewModel(coordinator: self, view: controller)
        controller.viewModel = viewModel
        navigation.pushViewController(controller)
    }
}
