//
//  FakeBookPerfilButton.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 20/12/22.
//

import UIKit

final class FakeBookPerfilButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FakeBookPerfilButton: Setup {
    func configure() {
        tintColor = .label
        imageView?.contentMode = .scaleAspectFill
        imageView?.clipsToBounds = true
    }
    func constrain() {
        imageView?.enableAutoLayout
            .constraint(attributes: [.centerX, .centerY])
            .shape(size: screen.width*0.15)
            .layer.cornerRadius = screen.width*0.15/2
    }
}
