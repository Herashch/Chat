//
//  HomeViewModel.swift
//  Chat
//
//  Created by Ivan Herashchenko on 16.03.2021.
//

import UIKit

protocol HomeViewModelProtocol where Self: AnyObject {
    func changeView(index: Int)
    func getViews() -> [UIViewController]
}

final class HomeViewModel: HomeViewModelProtocol {
    
    // MARK: - Private properties
    
    private let view: HomeViewControllerProtocol!
    private let coordinator: HomeCoordinatorProtocol!
    private var controllers: [UIViewController] = []
    
    // MARK: - Inits
    
    init(coordinator: HomeCoordinatorProtocol, view: HomeViewControllerProtocol) {
        self.coordinator = coordinator
        self.view = view
        self.setupViewControllers()
    }
    
    // MARK: - HomeViewModelProtocol
    
    func changeView(index: Int) {
        
    }
    
    func getViews() -> [UIViewController] {
        return controllers
    }
}

private extension HomeViewModel {
    func setupViewControllers () {
        let coordinator = ChatListCoordinator()
        controllers.append(coordinator.start())
        controllers.append(UIViewController())
    }
}
