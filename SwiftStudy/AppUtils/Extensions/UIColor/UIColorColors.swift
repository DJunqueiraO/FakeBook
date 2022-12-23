//
//  UIColorCustomColors.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 16/12/22.
//

import UIKit

extension UIColor {
    class var reverseDark: UIColor {UIColor(named: "reverseDark") ?? UIColor()}
    class var weakDark: UIColor {UIColor(white: 0, alpha: 1/3)}
    class var weakWhite: UIColor {UIColor(white: 1, alpha: 2/3)}
}
