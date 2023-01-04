//
//  CommentView.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 23/12/22.
//

import UIKit

final class CommentView: UIView {
    let postStackView = FeedPostStackView()
    private lazy var scroll: (view: UIScrollView, stackView: UIStackView) = {
        let scrollView = UIScrollView()
        let scrollStackView = scrollView.toScroll(views: [postStackView])
        return (view: scrollView, stackView: scrollStackView)
    }()
    init(_ post: Post?) {
        super.init(frame: .zero)
        postStackView.post = post
        setup()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupComments() {
        guard let comments = postStackView.post?.comments else {return}
        for comment in comments {
            let commentLabel = UILabel()
            commentLabel.text = comment
            scroll.stackView.addArrangedSubview(commentLabel)
        }
    }
}

extension CommentView: Setup {
    func configure() {
        backgroundColor = .reverseDark
        addSubview(scroll.view)
        setupComments()
    }
    func constrain() {
        scroll.view.enableAutoLayout
            .constraint(attributes: [.top, .leading, .trailing, .bottom],
                        to: safeAreaLayoutGuide)
    }
}
