//
//  UINavigationController+Navigation.swift
//  Straightening
//
//  Created by Josicleison Elves on 27/08/1401 AP.
//

import UIKit

extension UINavigationController {
    func navigate<T: UIViewController>(to viewController: T) {
        for viewController in self.viewControllers where ((viewController as? T) != nil) {
            self.popToViewController(viewController, animated: true); return
        }
        self.pushViewController(viewController, animated: true)
    }
}
