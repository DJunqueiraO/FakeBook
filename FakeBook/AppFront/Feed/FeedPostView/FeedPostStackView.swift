//
//  FakeBookPostView.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 16/12/22.
//

import UIKit

final class FeedPostStackView: UIStackView {
    var post: Post? = nil {
        didSet {
            if let image = post?.perfilImage {
                perfilStackView.perfilButton.setImage(UIImage(named: image), for: .normal)
            }
            perfilStackView.perfilName.label.text = post?.name
            if let image = post?.image,
               let postImage = UIImage(named: image) {createPostContentImageView(postImage)}
            postContent.label.text = post?.description
        }
    }
    private lazy var perfilStackView = FeedPostPerfilStackView()
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
    lazy var buttonsStackView = FeedPostButtonsStackView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func createPostContentImageView(_ image: UIImage) {
        let postContentImageView = Create.element.imageView(image)
        postContent.stackView.addArrangedSubview(postContentImageView)
        postContentImageView.enableAutoLayout
            .constraint(attributesAttributes: [.height: .width])
    }
    @objc private func likeButtonTarget(_ sender: UIButton) {
        guard var post = post,
              let id = post.id,
              let likes = post.likes else {return}
        if sender.isSelected {
            post.likes = likes - 1
            Task {
                await Network.put(post, from: .fakeBookPosts(id: id))
            }
        }
    }
}

extension FeedPostStackView: Setup {
    func configure() {
        backgroundColor = .reverseDark
        axis = .vertical
        addArrangedSubviews([perfilStackView, postContent.stackView, buttonsStackView])
        
        buttonsStackView.likeButton.addTarget(self, action: #selector(likeButtonTarget), for: .touchUpInside)
        
    }
    func constrain() {
        perfilStackView.perfilButton.enableAutoLayout
            .constraint(attribute: .width, multiplier: 0.2)
            .constraint(attributesAttributes: [.height: .width], multiplier: 0.2)
        perfilStackView.plusButton.enableAutoLayout.enableAutoLayout
            .constraint(attribute: .width, multiplier: 0.2)
    }
}
