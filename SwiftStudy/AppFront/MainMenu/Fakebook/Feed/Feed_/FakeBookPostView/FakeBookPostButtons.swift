//
//  FakeBookPostButtons.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 20/12/22.
//

import UIKit

final class FakeBookPostButtonsStackView: UIStackView {
    let likeButton = Create.element.button("Like", image: .star)
    let commentButton = Create.element.button("Comment", image: .message)
    let shareButton = Create.element.button("Share", image: .share)
    override func layoutSubviews() {
        setup()
    }
}

extension FakeBookPostButtonsStackView: Setup {
    func configure() {
        addArrangedSubviews([likeButton, commentButton, shareButton])
        distribution = .fillEqually
    }
}
