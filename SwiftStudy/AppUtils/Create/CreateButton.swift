//
//  CreateButton.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 14/12/22.
//

import UIKit

extension Create {
    static func button(_ title: String? = nil,
                       handler: UIActionHandler? = nil) -> UIButton {
        let button = UIButton()
        if let handler = handler {button.addAction(UIAction(handler: handler), for: .touchUpInside)}
        button.setTitle(title, for: .normal)
        button.setTitleColor(Assets.Colors.reverseDark, for: .normal)
        return button
    }
}
