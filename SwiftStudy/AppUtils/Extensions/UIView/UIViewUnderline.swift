//
//  UIView+addUnderLine.swift
//  Straightening
//
//  Created by Josicleison Elves on 11/09/1401 AP.
//

import UIKit

extension UIView {
    func addUnderline(_ color: UIColor? = .lightGray, height: CGFloat = 1) {
        let line = UIView()
        line.backgroundColor = color
        addSubview(line)
        line.enableAutoLayout
            .constraint(attributes: [.leading, .trailing, .bottom])
            .shape(height: height)
    }
}
