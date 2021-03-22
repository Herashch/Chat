//
//  MessageModel.swift
//  Chat
//
//  Created by Ivan Herashchenko on 19.03.2021.
//

import Foundation

struct MessageModel {
    let chatID: String
    let date: Date
    let id: String
    let text: String
    let userID: String
    
    static var initial: Self { .init(chatID: "", date: Date(), id: "", text: "", userID: "")
    }
}
