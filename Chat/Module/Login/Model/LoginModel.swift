//
//  LoginModel.swift
//  Chat
//
//  Created by Ivan Herashchenko on 15.03.2021.
//

import Foundation

struct LoginAndRegisterModel {
    let email: String
    let password: String
    
    static var initial: Self { .init(email: "",
                                     password: "") }
}

extension LoginAndRegisterModel {
    func updateEmailAndPassword(_ email: String, _ password: String) -> Self {
        .init(email: email, password: password)
    }
}
