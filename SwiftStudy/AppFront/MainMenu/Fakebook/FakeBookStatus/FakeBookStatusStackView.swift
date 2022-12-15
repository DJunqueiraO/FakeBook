//
//  FakeBookStatusStackView.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 15/12/22.
//

import UIKit

final class FakeBookStatusStackView: UIView {
    var perfilImage: UIImage? = nil {
        didSet {
            perfilButton.setImage(perfilImage, for: .normal)
        }
    }
    private lazy var perfilButton: UIButton = {
        let perfilButton = Create.element.button()
        perfilButton.imageView?.contentMode = .scaleAspectFill
        perfilButton.imageView?.clipsToBounds = true
        return perfilButton
    }()
    private lazy var galeryStackView: UIStackView = {
        let galleryButton = Create.element.button("Foto")
        let galleryIcon = UIImageView(image: Assets.Images.gallery)
        galleryIcon.contentMode = .scaleAspectFit
        let galeryStackView = UIStackView(arrangedSubviews: [galleryIcon,
                                                             galleryButton])
        galeryStackView.axis = .vertical
        return galeryStackView
    }()
    private lazy var statusTextField: UITextField = {
        let statusTextField = UITextField()
        statusTextField.backgroundColor = Assets.Colors.weakDark
        statusTextField.layer.cornerRadius = frame.height*0.025
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
        addSubviews([perfilButton, statusTextField, galeryStackView])
    }
    func constrain() {
        perfilButton.enableAutoLayout
            .constraint(attributes: [.leading, .centerY])
            .shape(height: frame.height*0.1, width: frame.width*0.2)
        perfilButton.imageView?.enableAutoLayout
            .constraint(attributes: [.centerX, .centerY])
            .constraint(attributes: [.width, .height],
                        multiplier: 0.7)
            .layer.cornerRadius = frame.height*0.7*0.05
        statusTextField.enableAutoLayout
            .constraint(attributes: [.centerY, .centerX])
            .shape(height: frame.height*0.07, width: frame.width*0.6)
        galeryStackView.enableAutoLayout
            .constraint(attributes: [.centerY, .trailing])
            .shape(width: frame.width*0.2)
    }
}
