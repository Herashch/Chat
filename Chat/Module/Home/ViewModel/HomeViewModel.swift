//
//  HomeViewModel.swift
//  Chat
//
//  Created by Ivan Herashchenko on 16.03.2021.
//

import Foundation

protocol HomeViewModelProtocol where Self: AnyObject {
    func changeView(index: Int)
}

final class HomeViewModel: HomeViewModelProtocol {
    
    // MARK: - Private properties
    
    private let view: HomeViewControllerProtocol!
    private let coordinator: HomeCoordinatorProtocol!
    
    // MARK: - Inits
    
    init(coordinator: HomeCoordinatorProtocol, view: HomeViewControllerProtocol) {
        self.coordinator = coordinator
        self.view = view
    }
    
    // MARK: - HomeViewModelProtocol
    
    func changeView(index: Int) {
        
    }
}
