//
//  ChatViewModel.swift
//  Chat
//
//  Created by Ivan Herashchenko on 17.03.2021.
//

import Foundation
import Firebase

protocol ChatViewModelProtocol {
    func getElements() -> [ChatViewCell.ViewModel]
    func getChatID() -> String
    func getTitle() -> String
    func getUserID() -> String
    func sendMessage(text: String)
}

final class ChatViewModel: ChatViewModelProtocol {
    
    // MARK: - Private properties
    
    private var chatID: String
    private var newMessageID: String = ""
    private var entity: [MessageModel] = [.initial]
    private var title: String
    private let db = Firestore.firestore()
    private let view: ChatViewControllerProtocol!
    private let coordinator: ChatCoordinatorProtocol!
    
    // MARK: - Inits
    
    init(coordinator: ChatCoordinatorProtocol, view: ChatViewControllerProtocol, chatID: String, title: String) {
        self.coordinator = coordinator
        self.view = view
        self.chatID = chatID
        self.title = title
        fetchMessages()
    }
    
    // MARK: - ChatViewModelProtocol
    
    func getElements() -> [ChatViewCell.ViewModel] {
        entity.enumerated().map {
            return ChatViewCell.ViewModel(chatID: $0.element.chatID, date: $0.element.date, id: $0.element.id, text: $0.element.text, userID: $0.element.userID)
        }
    }
    
    func getChatID() -> String {
        return chatID
    }
    
    func getTitle() -> String {
        return title
    }
    
    func getUserID() -> String {
        return Auth.auth().currentUser!.uid
    }
    
    func sendMessage(text: String) {
        newMessageID = db.collection("Message").addDocument(data: ["chatID": chatID,
                                                    "date": Date().timeIntervalSince1970,
                                                    "text": text,
                                                    "userID": Auth.auth().currentUser!.uid]) { error in
            if error != nil {
                print(error)
                return
            } else {
                self.updateChatData(messageText: text)
            }
        }.documentID
    }
}

private extension ChatViewModel {
    func fetchMessages() {
        entity.removeAll()
        db.collection("Message")
            .whereField("chatID", isEqualTo: chatID)
            .addSnapshotListener { (querySnapshot, error) in
                if error != nil {
                    print(error)
                    return
                } else {
                    if let snapshotDocuments = querySnapshot?.documents {
                        self.entity.removeAll()
                        for doc in snapshotDocuments {
                            let data = doc.data()
                            self.entity.append( .init(chatID: data["chatID"] as! String, date: Date(timeIntervalSince1970: data["date"] as! TimeInterval), id: doc.documentID, text: data["text"] as! String, userID: data["userID"] as! String))

                        }
                        self.entity.sort {
                            $0.date < $1.date
                        }
                        self.view.refresh()
                    }
                }
            }
    }
    
    func updateChatData(messageText: String) {
        db.collection("Chat").document(chatID).updateData(["lastMessage": messageText,"update": Date().timeIntervalSince1970, "messages": FieldValue.arrayUnion([newMessageID])])
    }
}
