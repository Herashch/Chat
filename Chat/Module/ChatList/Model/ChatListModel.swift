//
//  ChatListModel.swift
//  Chat
//
//  Created by Ivan Herashchenko on 16.03.2021.
//

import Foundation

struct ChatListModel {
    let avatar: String
    let content: String
    let title: String
    let time: Date
    let action: Command
    
    static var initial: Self { .init(avatar: "", content: "", title: "", time: Date(), action: .nop)
    }
}
