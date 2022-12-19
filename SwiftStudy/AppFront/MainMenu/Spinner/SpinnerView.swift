//
//  SpinnerView.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 19/12/22.
//

import UIKit

final class SpinnerView: UIView {
    private let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .reverseDark
        activityIndicator.hidesWhenStopped = false
        activityIndicator.startAnimating()
        activityIndicator.backgroundColor = .blue
        return activityIndicator
    }()
    private lazy var button = Create.element.button("Stop Spinning") {[weak self]_ in
        if let isAnimating = self?.activityIndicator.isAnimating, isAnimating {
            self?.activityIndicator.stopAnimating()
        } else {
            self?.activityIndicator.startAnimating()
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SpinnerView: Setup {
    func configure() {
        backgroundColor = .reverseDark
        addSubviews([activityIndicator, button])
    }
    func constrain() {
        activityIndicator.enableAutoLayout
            .constraint(attributes: [.centerY, .centerX])
            .shape(size: 100)
        button.enableAutoLayout
            .shape(height: 55)
            .constraint(attributes: [.leading, .trailing, .bottom],
                        to: safeAreaLayoutGuide)
    }
}

