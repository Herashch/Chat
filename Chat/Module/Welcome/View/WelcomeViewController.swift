//
//  ViewController.swift
//  Chat
//
//  Created by Ivan Herashchenko on 12.03.2021.
//

import UIKit

protocol WelcomeViewControllerProtocol {
    
}

final class WelcomeViewController: UIViewController, StoryboardCreatable {
    
    
    // MARK: - Public properties
    
    var viewModel: WelcomeViewModelProtocol!
    
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @IBAction func login() {
        viewModel.login.perform()
    }
    
    @IBAction func register() {
        viewModel.register.perform()
    }
}

// MARK: - WelcomeViewControllerProtocol

extension WelcomeViewController: WelcomeViewControllerProtocol {
    
}

