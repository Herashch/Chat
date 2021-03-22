//
//  HomeViewController.swift
//  Chat
//
//  Created by Ivan Herashchenko on 15.03.2021.
//

import UIKit

protocol HomeViewControllerProtocol {
    
}

enum HomeTab: Int {
    case HomeTabChats = 0
    case HomeTabEmpty = 1
}

final class HomeViewController: UITabBarController, StoryboardCreatable {
    
    // MARK: - Public properties
    
    var viewModel: HomeViewModelProtocol!
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
}

// MARK: - Private properties 

private extension HomeViewController {
    func setupTabBar() {
        setViewControllers(viewModel.getViews(), animated: false)
        if let tabBarItems = tabBar.items {
            tabBarItems[0].title = "Chats"
            tabBarItems[1].title = "Empty"
            tabBarItems[0].image = UIImage(systemName: "message")
            tabBarItems[1].image = UIImage(systemName: "trash.fill")
        }
    }
}

// MARK: - HomeViewControllerProtocol

extension HomeViewController: HomeViewControllerProtocol {
    
}
