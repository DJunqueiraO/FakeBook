//
//  FakeBookViewModel.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 16/12/22.
//

import Foundation

protocol FeedViewModelDelegate: AnyObject {
    func fakeBookViewModel(_ post: Post)
    func fakeBookViewModel(_ stories: [Story])
    func fakeBookViewModel(_ perfilImage: String)
}

final class FeedViewModel {
    weak var delegate: FeedViewModelDelegate?
    private var perfil = Perfil(image: "Gatsu", name: "Gatsu")
    private var posts: [Post] = [] {
        didSet {
            for post in posts {
                delegate?.fakeBookViewModel(post)
            }
        }
    }
    private lazy var stories: [Story] = [Story(image: perfil.image, name: "Adicionar ao Story")] {
        didSet {
            delegate?.fakeBookViewModel(stories)
        }
    }
    private lazy var navigationCollectionView = FeedNavigationCollectionView(
        imageNames: ["house", "person.and.person", "message", "play.tv", "bell"]
    )
    func loadData() {
        Task {
            guard let result = await Network.get(
                from: URL(string: "https://62baed237bdbe01d52938975.mockapi.io/api/FakeBookPosts")
            ) else {return}
            guard let posts = await Network.decode(Posts.self, from: result.data) else {return}
            self.posts = posts
        }
        Task {
            guard let stories = Network.read([Story].self, from: "FeedStoriesApi") else {return}
            self.stories += stories
        }
        if let image = perfil.image {delegate?.fakeBookViewModel(image)}
    }
}
