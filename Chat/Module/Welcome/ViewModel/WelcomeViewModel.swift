//
//  WelcomeViewModel.swift
//  Chat
//
//  Created by Ivan Herashchenko on 15.03.2021.
//

import UIKit

protocol WelcomeViewModelProtocol where Self: AnyObject {
    var login: Command { get }
    var register: Command { get }
}

final class WelcomeViewModel: WelcomeViewModelProtocol {
    
    // MARK: - Private properties
    
    private var view: WelcomeViewControllerProtocol!
    private var coordinator: WelcomeCoordinatorProtocol!
    
    // MARK: - Inits
    
    init(coordinator: WelcomeCoordinatorProtocol, view: WelcomeViewControllerProtocol) {
        self.coordinator = coordinator
        self.view = view
    }
    
    // MARK: - WelcomeViewModelProtocol
    
    lazy var login: Command = {
        return .init { [unowned self] in
            self.coordinator.toLogin()
        }
    }()
    
    lazy var register: Command = {
        return .init { [unowned self] in
            self.coordinator.toRegister()
        }
    }()
}
