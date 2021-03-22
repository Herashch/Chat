//
//  ChatListViewModel.swift
//  Chat
//
//  Created by Ivan Herashchenko on 16.03.2021.
//

import Foundation
import Firebase

protocol ChatListViewModelProtocol {
    func getElements() -> [ChatListCell.ViewModel]
    func openChat(id: String, title: String)
    var openAdd: Command { get }
}

final class ChatListViewModel: ChatListViewModelProtocol {
    
    // MARK: - Private properties
    
    private var entity: [ChatModel] = [.initial]
    private let db = Firestore.firestore()
    private let view: ChatListViewControllerProtocol!
    private let coordinator: ChatListCoordinatorProtocol!
    
    // MARK: - Inits
    
    init(coordinator: ChatListCoordinatorProtocol, view: ChatListViewControllerProtocol) {
        self.coordinator = coordinator
        self.view = view
        fetchChatData()
    }
    
    // MARK: - ChatListViewModelProtocol
    
    func getElements() -> [ChatListCell.ViewModel] {
        entity.enumerated().map {
            return ChatListCell.ViewModel(avatar: $0.element.avatar, content: $0.element.content, id: $0.element.id, title: $0.element.title, time: $0.element.time, action: $0.element.action)
        }
    }
    
    lazy var openAdd: Command = {
        return .init { [unowned self] in
            self.coordinator.toAddChat()
        }
    }()
    
    func openChat(id: String, title: String) {
        self.coordinator.toChat(id: id, title: title)
    }
}

// MARK: - Private methods

private extension ChatListViewModel {
    func fetchChatData() {
        entity.removeAll()
        db.collection("Chat")
            .whereField("users", arrayContains: Auth.auth().currentUser!.uid)
            .addSnapshotListener { querySnapshot, error in
                if error != nil {
                    print(error)
                    return
                } else {
                    if let snapshotDocuments = querySnapshot?.documents {
                        self.entity.removeAll()
                        for doc in snapshotDocuments {
                            let data = doc.data()
                            self.entity.append(.init(avatar: "FlowerGirl", content: data["lastMessage"] as! String, id: doc.documentID, title: data["name"] as! String, time: Date(timeIntervalSince1970: data["update"] as! TimeInterval), action: .nop))
                        }
                        self.entity.sort {
                            $0.time > $1.time
                        }
                        self.view.refresh()
                    }
                }
            }
    }
}
