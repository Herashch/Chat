//
//  UINavigationController.swift
//  Chat
//
//  Created by Ivan Herashchenko on 15.03.2021.
//

import UIKit

extension UINavigationController {
    func pushViewController(_ viewController: UIViewController,
                            popCount: Int = 0,
                            animated: Bool = true) {
        switch popCount {
        case 0:
            pushViewController(viewController, animated: animated)
        default:
            let vcCount = viewControllers.count
            let vcSlice = viewControllers[0..<(vcCount - popCount)]
            let vcArray = Array(vcSlice) + [viewController]
            setViewControllers(vcArray, animated: animated)
        }
    }
}
