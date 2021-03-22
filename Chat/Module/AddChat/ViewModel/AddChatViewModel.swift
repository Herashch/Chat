//
//  AddChatViewModel.swift
//  Chat
//
//  Created by Ivan Herashchenko on 19.03.2021.
//

import Foundation
import Firebase

protocol AddChatViewModelProtocol {
    var cancel: Command { get }
    func findUser(name: String, email: String)
}

final class AddChatViewModel: AddChatViewModelProtocol {
    
    // MARK: - Private properties
    
    private let db = Firestore.firestore()
    private let coordinator: AddChatCoordinatorProtocol!
    private let view: AddChatViewControllerProtocol!
    
    // MARK: - inits
    
    init(coordinator: AddChatCoordinatorProtocol, view: AddChatViewControllerProtocol) {
        self.coordinator = coordinator
        self.view = view
    }
    
    // MARK: - AddChatViewModelProtocol
    
    lazy var cancel: Command = {
        return .init { [unowned self] in
            self.coordinator.close()
        }
    }()
    
    func findUser(name: String, email: String) {
        
        if email == Auth.auth().currentUser!.email {
            view.showAlert(text: "You can not enter your mail")
            return
        }
        
        db.collection("User")
            .whereField("email", isEqualTo: email)
            .getDocuments { querySnapshot, error in
                if error != nil {
                    print(error)
                    return
                } else {
                    if let snapshotDocuments = querySnapshot?.documents {
                        if snapshotDocuments.count == 1 {
                            for doc in snapshotDocuments {
                                let data = doc.data()
                                self.addChat(name: name, id: data["id"] as! String, email: email)
                            }
                        } else {
                            self.view.showAlert(text: "No find email")
                        }
                    }
                }
            }
    }
    
    func addChat(name: String, id: String, email: String) {
        let idChat = db.collection("Chat").addDocument(data: ["group": false,
                                                              "lastMessage": "No message",
                                                              "name": name,
                                                              "messages": [""],
                                                              "update": Date().timeIntervalSince1970,
                                                              "users": [Auth.auth().currentUser!.uid, id]
        ]) { (error) in
            if error != nil {
                print(error)
            } else {
                self.coordinator.close()
            }
        }.documentID
        db.collection("User").document(Auth.auth().currentUser!.uid).updateData(["chats": FieldValue.arrayUnion([idChat])])
        db.collection("User").document(id).updateData(["chats": FieldValue.arrayUnion([idChat])])
    }
    
}
