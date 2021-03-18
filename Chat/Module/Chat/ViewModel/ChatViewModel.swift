//
//  ChatViewModel.swift
//  Chat
//
//  Created by Ivan Herashchenko on 17.03.2021.
//

import Foundation

protocol ChatViewModelProtocol {
    
}

final class ChatViewModel: ChatViewModelProtocol {
    
    // MARK: - Private properties
    
    private let view: ChatViewControllerProtocol!
    private let coordinator: ChatCoordinatorProtocol!
    
    // MARK: - Inits
    
    init(coordinator: ChatCoordinatorProtocol, view: ChatViewControllerProtocol) {
        self.coordinator = coordinator
        self.view = view
    }
    
    // MARK: - ChatViewModelProtocol
    
}
