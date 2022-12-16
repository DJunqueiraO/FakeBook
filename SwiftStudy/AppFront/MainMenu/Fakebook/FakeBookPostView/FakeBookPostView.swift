//
//  FakeBookPostView.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 16/12/22.
//

import UIKit

final class FakeBookPostView: UIView {
    var post: FakeBookPost? = nil {
        didSet {
            perfilButton.setImage(post?.perfilImage, for: .normal)
            perfilName.label.text = post?.name
            if let postImage = post?.image {createPostContentImageView(postImage)}
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
    private lazy var postStackView: UIStackView = {
        let perfilStackView = UIStackView(arrangedSubviews: [perfilButton, perfilName.stackView, plusButton])
        let postStackView = Create.element.stackView(arrangedSubviews: [perfilStackView, postContent.stackView])
        return postStackView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func createPostContentImageView(_ image: UIImage) {
        let postContentImageView = Create.element.imageView(image)
        postContentImageView.backgroundColor = .blue
        postContent.stackView.addArrangedSubview(postContentImageView)
        postContentImageView.enableAutoLayout
            .constraint(attributesAttributes: [.height: .width])
    }
}

extension FakeBookPostView: Setup {
    func configure() {
        backgroundColor = .reverseDark
        addSubview(postStackView)
    }
    func constrain() {
        postStackView.enableAutoLayout
            .constraint(attributes: [.top, .leading, .trailing, .bottom])
        perfilButton.enableAutoLayout
            .constraint(attribute: .width, multiplier: 0.2)
            .constraint(attributesAttributes: [.height: .width], to: perfilButton)
        perfilButton.imageView?.enableAutoLayout
            .constraint(attributes: [.centerX, .centerY])
            .constraint(attributes: [.width, .height],
                        multiplier: 0.7)
            .layer.cornerRadius = frame.height*0.7*0.25*0.2
        perfilName.stackView.enableAutoLayout
            .constraint(attribute: .width, multiplier: 0.6)
        plusButton.enableAutoLayout.enableAutoLayout
            .constraint(attribute: .width, multiplier: 0.2)
            .constraint(attributesAttributes: [.height: .width], to: perfilButton)
        plusButton.imageView?.enableAutoLayout
            .constraint(attributes: [.centerX, .centerY])
            .constraint(attributes: [.width, .height],
                        multiplier: 0.5)
    }
}
