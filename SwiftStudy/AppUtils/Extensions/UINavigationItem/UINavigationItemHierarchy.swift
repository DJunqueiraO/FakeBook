//
//  UInavigationItemHierarchy.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 15/12/22.
//

import UIKit

extension UINavigationItem {
    func hideRightBarButtonItems() {
        guard let items = rightBarButtonItems else {return}
        for item in items {
            item.isHidden = true
        }
    }
    func showRightBarButtonItems() {
        guard let items = rightBarButtonItems else {return}
        for item in items {
            item.isHidden = false
        }
    }
}
