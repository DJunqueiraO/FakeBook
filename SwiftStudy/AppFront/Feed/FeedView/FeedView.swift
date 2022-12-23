//
//  FakeBookView.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 15/12/22.
//

import UIKit

protocol FeedViewDelegate: AnyObject {
    func fakeBookView(willComment post: Post?) -> UIAction?
}

extension FeedViewDelegate {
    func fakeBookView(willComment post: Post?) -> UIAction? {return nil}
}

final class FeedView: UIView {
    weak var delegate: FeedViewDelegate?
    private lazy var fakeBookViewModel: FeedViewModel = {
        let fakeBookViewModel = FeedViewModel()
        fakeBookViewModel.delegate = self
        return fakeBookViewModel
    }()
    private lazy var navigationCollectionView = FeedNavigationCollectionView(
        imageNames: ["house", "person.and.person", "message", "play.tv", "bell"]
    )
    private lazy var statusStackView: FeedStatusStackView = {
        let statusStackView = FeedStatusStackView(frame: frame)
        return statusStackView
    }()
    private lazy var storiesCollectionView = FeedStoriesCollectionView()
    private lazy var storiesStackView: UIStackView = {
        let storiesStackView = UIStackView(arrangedSubviews: [storiesCollectionView])
        storiesStackView.backgroundColor = .reverseDark
        storiesStackView.isLayoutMarginsRelativeArrangement = true
        storiesStackView.layoutMargins = UIEdgeInsets(top: frame.height*0.005,
                                                      left: frame.height*0.01,
                                                      bottom: frame.height*0.005,
                                                      right: 0)
        return storiesStackView
    }()
    private lazy var scroll: (view: UIScrollView, toScrollStackView: UIStackView) = {
        let scrollView = UIScrollView()
        let stackView = scrollView.toScroll()
        stackView.spacing = frame.height*0.01
        stackView.backgroundColor = .lightGray
        return (view: scrollView, toScrollStackView: stackView)
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func createPostStackView(_ post: Post?) {
        let postStackView = FeedPostStackView(frame: frame)
        postStackView.post = post
        if let action = delegate?.fakeBookView(willComment: post) {
            postStackView.buttonsStackView.commentButton.addAction(action, for: .touchUpInside)
        }
        scroll.toScrollStackView.addArrangedSubview(postStackView)
    }
}

extension FeedView: Setup {
    func configure() {
        addSubview(scroll.view)
        backgroundColor = .reverseDark
        fakeBookViewModel.loadData()
        scroll.toScrollStackView.addArrangedSubviews([navigationCollectionView, statusStackView, storiesStackView])
    }
    func constrain() {
        scroll.view.enableAutoLayout
            .constraint(attributes: [.top, .leading, .trailing, .bottom], to: safeAreaLayoutGuide)
        navigationCollectionView.enableAutoLayout
            .constraint(attributesAttributes: [.height: .width], multiplier: 0.15)
        statusStackView.enableAutoLayout
            .constraint(attributesAttributes: [.height: .width], multiplier: 0.2)
        storiesStackView.enableAutoLayout
            .constraint(attributesAttributes: [.height: .width], multiplier: 0.4)
    }
}

extension FeedView: FeedViewModelDelegate {
    func fakeBookViewModel(_ perfilImage: String) {
        statusStackView.perfilImage = UIImage(named: perfilImage)
    }
    func fakeBookViewModel(_ post: Post) {
        Task {[weak self] in
            self?.createPostStackView(post)
        }
    }
    func fakeBookViewModel(_ stories: [Story]) {
        Task {[weak self] in
            self?.storiesCollectionView.fakeBookStories = stories
        }
    }
}
