//
//  HomeCoordinator.swift
//  Chat
//
//  Created by Ivan Herashchenko on 16.03.2021.
//

import UIKit

protocol HomeCoordinatorProtocol {
    func start() -> UIViewController
}

final class HomeCoordinator { }

// MARK: - HomeCordinatorProtocol

extension HomeCoordinator: HomeCoordinatorProtocol {
    func start() -> UIViewController {
        let viewController = HomeViewController.createFromStoryboard()
        let viewModel = HomeViewModel(coordinator: self, view: viewController)
        viewController.viewModel = viewModel
        return viewController
    }
}
