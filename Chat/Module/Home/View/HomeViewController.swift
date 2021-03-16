//
//  HomeViewController.swift
//  Chat
//
//  Created by Ivan Herashchenko on 15.03.2021.
//

import UIKit

protocol HomeViewControllerProtocol {
    
}

final class HomeViewController: UIViewController, StoryboardCreatable {
    
    
    // MARK: - Public properties
    
    var viewModel: HomeViewModelProtocol!
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - HomeVIewControllerProtocol

extension HomeViewController: HomeViewControllerProtocol {
    
}
