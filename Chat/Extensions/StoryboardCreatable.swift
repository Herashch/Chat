//
//  StoryboardCreatable.swift
//  Chat
//
//  Created by Ivan Herashchenko on 15.03.2021.
//

import UIKit

protocol StoryboardCreatable {
    static var bundle: Bundle { get }
    static var identifierInStoryboard: String { get }
    static var storyboardName: String { get }
}

extension StoryboardCreatable {
    static var bundle: Bundle {
        return Bundle.main
    }
}

extension StoryboardCreatable where Self: UIViewController {
    static var identifierInStoryboard: String {
        return String(describing: self)
    }
    
    static var storyboardName: String {
        return String(describing: self)
    }
    
    static func createFromStoryboard() -> Self {
        let storyboard = UIStoryboard(name: storyboardName, bundle: bundle)
        return storyboard.instantiateViewController(withIdentifier: identifierInStoryboard) as! Self
    }
}
