//
//  BaseNavigationVC.swift
//  Chat
//
//  Created by Ivan Herashchenko on 15.03.2021.
//

import UIKit

class BaseNavigationVC: UINavigationController, StoryboardCreatable {
    
    // MARK: - Public properties
    
//    static var storyboardName: String { return R.storyboard.main.name }
    
    var defaultStatusBarStyle = true {
        didSet {
            setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return defaultStatusBarStyle ? .default : .lightContent
    }
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.tintColor = .black
    }
    
    // MARK: - Public methods
    
    func changeToWhite() {
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.tintColor = .white
        
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationBar.titleTextAttributes = textAttributes
    }
    
    func changeToBlack() {
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.tintColor = .black
        
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        navigationBar.titleTextAttributes = textAttributes
    }
    
    func changeToDefault() {
        navigationBar.setBackgroundImage(nil, for: .default)
        navigationBar.shadowImage = nil
        navigationBar.tintColor = .black
        
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        navigationBar.titleTextAttributes = textAttributes
    }
}
