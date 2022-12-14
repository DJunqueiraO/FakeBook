//
//  CreateNavigationController.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 14/12/22.
//

import UIKit

extension Create {
    static func navigationController(rootViewController: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.navigationBar.tintColor = Assets.Colors.reverseDark
        return navigationController
    }
}
