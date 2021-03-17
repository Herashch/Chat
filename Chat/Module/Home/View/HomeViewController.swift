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

final class HomeViewController: UIViewController, StoryboardCreatable {
    
    // MARK: - Outlets
    
    @IBOutlet weak private var tabBar: UITabBar!
    @IBOutlet weak private var viewContent: UIView!
    
    // MARK: - Private properties
    
    private var currentTab: HomeTab = HomeTab.HomeTabChats
    
    private let chatListView: ChatListViewController = ChatListViewController()
    
    // MARK: - Public properties
    
    var viewModel: HomeViewModelProtocol!
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

private extension HomeViewController {
    func setupView() {
        let views = viewModel.getViews()
        views.forEach {
            $0.view.frame = viewContent.bounds
            $0.view.isHidden = false
            $0.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            viewContent.addSubview($0.view)
        }
    }
}

// MARK: - HomeViewControllerProtocol

extension HomeViewController: HomeViewControllerProtocol {
    
}
