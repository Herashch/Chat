//
//  AddChatViewModel.swift
//  Chat
//
//  Created by Ivan Herashchenko on 19.03.2021.
//

import Foundation

protocol AddChatViewModelProtocol {
    
}

final class AddChatViewModel: AddChatViewModelProtocol {
    
    // MARK: - Private properties
    
    private let coordinator: AddChatCoordinatorProtocol!
    private let view: AddChatViewControllerProtocol!
    
    // MARK: - inits
    
    init(coordinator: AddChatCoordinatorProtocol, view: AddChatViewControllerProtocol) {
        self.coordinator = coordinator
        self.view = view
    }
    
    // MARK: - AddChatViewModelProtocol
    
    
}
