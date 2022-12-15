//
//  FakeBookStatusStackView.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 15/12/22.
//

import UIKit

final class FakeBookStatusStackView: UIView {
    private lazy var perfilButton = Create.element.button("Lero")
    private lazy var galeryButton = Create.element.button(" Lero")
    private lazy var statusTextField: UITextField = {
        let statusTextField = UITextField()
        statusTextField.backgroundColor = .red
        return statusTextField
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FakeBookStatusStackView: Setup {
    func configure() {
        addSubviews([perfilButton, statusTextField, galeryButton])
    }
    func constrain() {
        perfilButton.enableAutoLayout
            .constraint(attributes: [.leading, .centerY])
            .shape(width: frame.width*0.2)
        statusTextField.enableAutoLayout
            .constraint(attributes: [.centerY, .centerX])
            .shape(width: frame.width*0.6)
        galeryButton.enableAutoLayout
            .constraint(attributes: [.centerY, .trailing])
            .shape(width: frame.width*0.2)
    }
}
