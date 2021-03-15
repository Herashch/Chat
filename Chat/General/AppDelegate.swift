//
//  AppDelegate.swift
//  Chat
//
//  Created by Ivan Herashchenko on 12.03.2021.
//

import Firebase
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // MARK: - Internal properties
    
    internal var window: UIWindow?
    
    // MARK: - Life cycle
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        configureView()
        return true
    }
}

// MARK: - Private methods

private extension AppDelegate {
    func configureView() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let coordinator = WelcomeCoordinator()
        self.window?.rootViewController = coordinator.configure()
        self.window?.makeKeyAndVisible()
    }
}

