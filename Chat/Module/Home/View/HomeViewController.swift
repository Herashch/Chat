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
        setViewControllers(viewModel.getViews(), animated: false)
    }
    
}

// MARK: - HomeViewControllerProtocol

extension HomeViewController: HomeViewControllerProtocol {
    
}
