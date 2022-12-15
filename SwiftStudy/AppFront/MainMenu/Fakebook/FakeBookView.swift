//
//  FakeBookView.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 15/12/22.
//

import UIKit

final class FakeBookView: UIView {
    private lazy var collectionView: UICollectionView = {
        let collectionView = FakeBookCollectionView(imageNames: ["house",
                                                                 "person.and.person",
                                                                 "message",
                                                                 "play.tv",
                                                                 "bell"])
        return collectionView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FakeBookView: Setup {
    func configure() {
        addSubview(collectionView)
        backgroundColor = Assets.Colors.reverseDark
    }
    func constrain() {
        collectionView.enableAutoLayout
            .constraint(attributes: [.top, .leading, .trailing], to: safeAreaLayoutGuide)
            .shape(height: frame.height*0.075)
    }
}
