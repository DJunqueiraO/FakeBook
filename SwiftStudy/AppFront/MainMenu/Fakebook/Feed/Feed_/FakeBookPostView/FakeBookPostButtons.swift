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
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        print("init", Calendar.current.component(.nanosecond, from: Date()))
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        print("layoutSubviews", Calendar.current.component(.nanosecond, from: Date()))
    }
}

extension FakeBookPostButtonsStackView: Setup {
    func configure() {
        addArrangedSubviews([likeButton, commentButton, shareButton])
        distribution = .fillEqually
    }
}
