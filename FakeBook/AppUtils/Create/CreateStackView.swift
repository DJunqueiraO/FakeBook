//
//  CreateStackView.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 16/12/22.
//

import UIKit

extension Create {
    func stackView(arrangedSubviews: [UIView] = []) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        stackView.axis = .vertical
        return stackView
    }
}
