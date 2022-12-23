//
//  CommentView.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 23/12/22.
//

import UIKit

final class CommentView: UIView {
    let postStackView = FeedPostStackView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CommentView: Setup {
    func configure() {
        backgroundColor = .reverseDark
        addSubview(postStackView)
    }
    func constrain() {
        postStackView.enableAutoLayout
            .constraint(attributes: [.top, .leading, .trailing], to: safeAreaLayoutGuide)
    }
}
