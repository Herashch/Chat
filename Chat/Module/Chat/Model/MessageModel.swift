//
//  MessageModel.swift
//  Chat
//
//  Created by Ivan Herashchenko on 19.03.2021.
//

import Foundation

struct MessageModel {
    let sender: String
    let text: String
    let date: Date
    
    static var initial: Self { .init(sender: "", text: "", date: Date())
    }
}
