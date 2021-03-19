//
//  AddChatViewController.swift
//  Chat
//
//  Created by Ivan Herashchenko on 19.03.2021.
//

import UIKit

protocol AddChatViewControllerProtocol {
    
}

final class AddChatViewController: UIViewController, StoryboardCreatable {
    
    
    // MARK: - Public properties
    
    var viewModel: AddChatViewModelProtocol!
    
    // MARK: - Life cycle 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = ""
    }
}

// MARK: - AddChatViewControllerProtocol

extension AddChatViewController: AddChatViewControllerProtocol {
    
}
