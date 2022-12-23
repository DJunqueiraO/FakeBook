//
//  UIScrollView+Hierarchy.swift
//  Straightening
//
//  Created by Josicleison Elves on 03/09/1401 AP.
//

import UIKit

extension UIScrollView {
    @discardableResult func toScroll(views: [UIView] = []) -> UIStackView {
        removeSubviews()
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        addConstraints([
            stackView.topAnchor.constraint(equalTo: contentLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentLayoutGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentLayoutGuide.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: frameLayoutGuide.widthAnchor)
        ])
        return stackView
    }
    @discardableResult func toScroll(view: UIView) -> UIView {
        removeSubviews()
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        addConstraints([
            view.topAnchor.constraint(equalTo: contentLayoutGuide.topAnchor),
            view.leadingAnchor.constraint(equalTo: contentLayoutGuide.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: contentLayoutGuide.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: contentLayoutGuide.bottomAnchor),
            view.widthAnchor.constraint(equalTo: frameLayoutGuide.widthAnchor)
        ])
        return view
    }
}
