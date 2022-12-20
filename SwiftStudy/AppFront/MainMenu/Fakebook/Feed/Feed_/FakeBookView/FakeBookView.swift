//
//  FakeBookView.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 15/12/22.
//

import UIKit

final class FakeBookView: UIView {
    private lazy var fakeBookViewModel: FakeBookViewModel = {
        let fakeBookViewModel = FakeBookViewModel()
        fakeBookViewModel.delegate = self
        return fakeBookViewModel
    }()
    private lazy var navigationCollectionView = FakeBookNavigationCollectionView(
        imageNames: ["house", "person.and.person", "message", "play.tv", "bell"]
    )
    private lazy var statusStackView: FakeBookStatusStackView = {
        let statusStackView = FakeBookStatusStackView(frame: frame)
        return statusStackView
    }()
    private lazy var storiesCollectionView = FakeBookStoriesCollectionView()
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
    private func createPostView(_ post: FakeBookPost?) {
        let postView = FakeBookPostStackView(frame: frame)
        postView.post = post
        scroll.toScrollStackView.addArrangedSubview(postView)
    }
}

extension FakeBookView: Setup {
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
            .shape(height: frame.height*0.075)
        statusStackView.enableAutoLayout
            .shape(height: frame.height*0.1)
        storiesStackView.enableAutoLayout
            .shape(height: frame.height*0.2)
    }
}

extension FakeBookView: FakeBookViewModelDelegate {
    func fakeBookViewModel(_ perfilImage: String) {
        statusStackView.perfilImage = UIImage(named: perfilImage)
    }
    func fakeBookViewModel(_ post: FakeBookPost) {
        Task {[weak self] in
            self?.createPostView(post)
        }
    }
    func fakeBookViewModel(_ stories: [FakeBookStory]) {
        Task {[weak self] in
            self?.storiesCollectionView.fakeBookStories = stories
        }
    }
}
