//
//  UIAlertController+Hierarchy.swift
//  Straightening
//
//  Created by Josicleison Elves on 15/09/1401 AP.
//

import UIKit

extension UIAlertController {
    var baseView: UIView {
        return view.subviews.first?.subviews.first ?? UIView()
    }
}
