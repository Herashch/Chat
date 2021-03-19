//
//  ChatListViewModel.swift
//  Chat
//
//  Created by Ivan Herashchenko on 16.03.2021.
//

import Foundation

protocol ChatListViewModelProtocol {
    func getElements() -> [ChatListCell.ViewModel]
    var openAdd: Command { get }
    var openChat: Command { get }
}

final class ChatListViewModel: ChatListViewModelProtocol {
    
    // MARK: - Private properties
    
    private var entity: [ChatModel] = [.initial]
    private let view: ChatListViewControllerProtocol!
    private let coordinator: ChatListCoordinatorProtocol!
    
    // MARK: - Inits
    
    init(coordinator: ChatListCoordinatorProtocol, view: ChatListViewControllerProtocol) {
        self.coordinator = coordinator
        self.view = view
        configure()
    }
    
    // MARK: - ChatListViewModelProtocol
    
    func getElements() -> [ChatListCell.ViewModel] {
        entity.enumerated().map {
            return ChatListCell.ViewModel(avatar: $0.element.avatar, content: $0.element.content, title: $0.element.title, time: $0.element.time, action: $0.element.action)
        }
    }
    
    lazy var openAdd: Command = {
        return .init { [unowned self] in
            self.coordinator.toAddChat()
        }
    }()
    
    lazy var openChat: Command = {
        return .init { [unowned self] in
            self.coordinator.toChat()
        }
    }()
}

// MARK: - Private methods

private extension ChatListViewModel {
    func configure() {
        entity = [.init(avatar: "FlowerGirl", content: "Content1", title: "Title1", time: Date(), action: .nop),
                  .init(avatar: "FlowerGirl", content: "Content2", title: "Title2", time: Date(), action: .nop),
                  .init(avatar: "FlowerGirl", content: "Content3", title: "Title3", time: Date(), action: .nop),
                  .init(avatar: "FlowerGirl", content: "Content4", title: "Title4", time: Date(), action: .nop),
                  .init(avatar: "FlowerGirl", content: "Content5", title: "Title5", time: Date(), action: .nop)]
    }
}
