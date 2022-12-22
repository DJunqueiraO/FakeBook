//
//  Create+Alert.swift
//  Straightening
//
//  Created by Josicleison Elves on 15/09/1401 AP.
//

import UIKit

extension Create {
    func alert(title: String?, message: String?,
               buttonTitle: String? = nil,
               preferredStyle: UIAlertController.Style = .alert) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        alert.baseView.subviews.first?.backgroundColor = .weakDark
        alert.baseView.subviews.last?.removeFromSuperview()
        alert.baseView.tintColor = .label
        if let buttonTitle = buttonTitle {alert.addAction(UIAlertAction(title: buttonTitle, style: .default))}
        return alert
    }
}
