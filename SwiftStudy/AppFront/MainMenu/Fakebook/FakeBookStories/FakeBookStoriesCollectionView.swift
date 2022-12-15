//
//  FakeBookStoriesCollectionView.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 15/12/22.
//

import UIKit

final class FakeBookStoriesCollectionView: UICollectionView {
    private let identifier = "Cell"
    var images: [UIImage?] = [] {
        didSet {
            reloadData()
        }
    }
    init(images: [UIImage?]) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        setup()
        self.images = images
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FakeBookStoriesCollectionView: Setup {
    func configure() {
        delegate = self
        dataSource = self
        register(FakeBookStoriesCollectionViewCell.self, forCellWithReuseIdentifier: identifier)
    }
}

extension FakeBookStoriesCollectionView: UICollectionViewDelegate,
                                         UICollectionViewDataSource,
                                         UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
            guard let cell = cell as? FakeBookStoriesCollectionViewCell else {return cell}
            cell.setupAsPerfilStory(images[indexPath.row], name: "Lero Lero")
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
            guard let cell = cell as? FakeBookStoriesCollectionViewCell else {return cell}
            cell.setupStory(images[indexPath.row], name: "Lero Lero")
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width*0.3,
                      height: collectionView.frame.height)
    }
}
