//
//  FakeBookPostView.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 16/12/22.
//

import UIKit

final class FakeBookPostView: UIStackView {
    var post: FakeBookPost? = nil {
        didSet {
            if let image = post?.perfilImage {perfilButton.setImage(UIImage(named: image), for: .normal)}
            perfilName.label.text = post?.name
            if let image = post?.image,
               let postImage = UIImage(named: image) {createPostContentImageView(postImage)}
            postContent.label.text = post?.description
        }
    }
    private lazy var perfilButton: UIButton = {
        let perfilButton = Create.element.button()
        perfilButton.imageView?.contentMode = .scaleAspectFill
        perfilButton.imageView?.clipsToBounds = true
        return perfilButton
    }()
    private lazy var perfilName: (stackView: UIStackView, label: UILabel) = {
        let perfilNameLabel = Create.element.label()
        let perfilNameStackView = UIStackView(arrangedSubviews: [perfilNameLabel])
        perfilNameStackView.axis = .vertical
        return (stackView: perfilNameStackView, label: perfilNameLabel)
    }()
    private lazy var plusButton: UIButton = {
        let plusButton = Create.element.button(image: .plus)
        plusButton.tintColor = .lightGray
        return plusButton
    }()
    private lazy var postContent: (stackView: UIStackView, label: UILabel) = {
        let descriptionLabel = Create.element.label()
        descriptionLabel.font = UIFont.systemFont(ofSize: 15)
        let descriptionStackView = UIStackView(arrangedSubviews: [descriptionLabel])
        descriptionStackView.axis = .vertical
        descriptionStackView.isLayoutMarginsRelativeArrangement = true
        descriptionStackView.layoutMargins = UIEdgeInsets(top: frame.width*0.025,
                                                          left: frame.width*0.025,
                                                          bottom: frame.width*0.025,
                                                          right:  frame.width*0.025)
        let postContentStackView = UIStackView(arrangedSubviews: [descriptionStackView])
        postContentStackView.axis = .vertical
        return (stackView: postContentStackView, label: descriptionLabel)
    }()
    private lazy var buttonsStackView: FakeBookPostButtonsStackView = {
        let buttonsStackView = FakeBookPostButtonsStackView()
        return buttonsStackView
    }()
    private lazy var perfilStackView: UIStackView = {
        let perfilStackView = UIStackView(arrangedSubviews: [perfilButton, perfilName.stackView, plusButton])
        return perfilStackView
    }()
    override func layoutSubviews() {
        setup()
    }
    private func createPostContentImageView(_ image: UIImage) {
        let postContentImageView = Create.element.imageView(image)
        postContent.stackView.addArrangedSubview(postContentImageView)
        postContentImageView.enableAutoLayout
            .constraint(attributesAttributes: [.height: .width])
    }
}

extension FakeBookPostView: Setup {
    func configure() {
        backgroundColor = .reverseDark
        axis = .vertical
        addArrangedSubviews([perfilStackView, postContent.stackView, buttonsStackView])
    }
    func constrain() {
        perfilButton.enableAutoLayout
            .constraint(attribute: .width, multiplier: 0.2)
            .constraint(attributesAttributes: [.height: .width], to: perfilButton)
        perfilButton.imageView?.enableAutoLayout
            .constraint(attributes: [.centerX, .centerY])
            .constraint(attributes: [.width, .height],
                        multiplier: 0.7)
            .layer.cornerRadius = frame.height*0.7*0.25*0.2
        plusButton.enableAutoLayout.enableAutoLayout
            .constraint(attribute: .width, multiplier: 0.2)
            .constraint(attributesAttributes: [.height: .width], to: perfilButton)
        plusButton.imageView?.enableAutoLayout
            .constraint(attributes: [.centerX, .centerY])
            .constraint(attributes: [.width, .height],
                        multiplier: 0.5)
    }
}
