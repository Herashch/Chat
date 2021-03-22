//
//  ChatListModel.swift
//  Chat
//
//  Created by Ivan Herashchenko on 16.03.2021.
//

import Foundation

struct ChatModel {
    let avatar: String
    let content: String
    let id: String
    let title: String
    let time: Date
    let action: Command
    
    static var initial: Self { .init(avatar: "", content: "", id: "", title: "", time: Date(), action: .nop)
    }
}
