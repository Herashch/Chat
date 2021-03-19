//
//  UserModel.swift
//  Chat
//
//  Created by Ivan Herashchenko on 19.03.2021.
//

import Foundation

struct UserModel {
    let id: String
    let chats: [ChatModel]
    let email: String
    let avatar: String
    let name: String
    let surname: String
    
    static var initial: Self { .init(id: "", chats: [], email: "", avatar: "", name: "", surname: "")
    }
}
