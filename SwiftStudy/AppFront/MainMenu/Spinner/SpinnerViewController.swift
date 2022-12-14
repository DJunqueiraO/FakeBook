//
//  SpinnerViewController.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 14/12/22.
//

import UIKit

final class SpinnerViewController: UIViewController {
    private let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = Assets.Colors.reverseDark
        activityIndicator.hidesWhenStopped = false
        activityIndicator.startAnimating()
        activityIndicator.backgroundColor = .blue
        return activityIndicator
    }()
    private lazy var button = Create.button("Stop Spinning") {[weak self]_ in
        if let isAnimating = self?.activityIndicator.isAnimating, isAnimating {
            self?.activityIndicator.stopAnimating()
        } else {
            self?.activityIndicator.startAnimating()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension SpinnerViewController: Setup {
    func configure() {
        view.backgroundColor = .label
        view.addSubviews([activityIndicator, button])
    }
    func constrain() {
        activityIndicator.enableAutoLayout
            .constraint(attributes: [.centerY, .centerX])
            .shape(size: 100)
        button.enableAutoLayout
            .shape(height: 55)
            .constraint(attributes: [.leading, .trailing, .bottom],
                        to: view.safeAreaLayoutGuide)
    }
}
