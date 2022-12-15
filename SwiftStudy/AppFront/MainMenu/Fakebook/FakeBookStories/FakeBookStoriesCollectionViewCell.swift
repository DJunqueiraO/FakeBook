//
//  FakeBookStoriesCollectionViewCell.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 15/12/22.
//

import UIKit

final class FakeBookStoriesCollectionViewCell: UICollectionViewCell {
    private lazy var imageView = UIImageView()
    private lazy var label = Create.element.label()
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubviews([imageView, label])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupAsPerfilStory(_ image: UIImage?, name: String) {
        imageView.image = image
        label.text = name
        label.enableAutoLayout
            .constraint(attributes: [.leading, .trailing, .bottom])
        label.textColor = .black
        createPlusFakeButton()
        imageView.enableAutoLayout
            .constraint(attributes: [.top, .leading, .trailing])
            .constraint(attribute: .height, multiplier: 0.6)
    }
    func setupStory(_ image: UIImage?, name: String) {
        imageView.image = image
        label.text = name
        label.enableAutoLayout
            .constraint(attributes: [.leading, .trailing, .bottom])
        label.textColor = .white
        imageView.enableAutoLayout
            .constraint(attributes: [.top, .leading, .trailing, .bottom])
    }
    private func createPlusFakeButton() {
        let button = UIImageView(image: Assets.Images.plus)
        button.tintColor = .label
        button.backgroundColor = Assets.Colors.reverseDark
        contentView.addSubview(button)
        button.enableAutoLayout
            .constraint(attributesConstants: [.centerY: frame.height*0.075, .centerX: 0])
            .constraint(attributesAttributes: [.height: .height, .width: .height], multiplier: 0.2)
        button.layer.cornerRadius = frame.height*0.2
    }
}

