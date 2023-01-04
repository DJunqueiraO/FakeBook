//
//  Facebook.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 15/12/22.
//

import UIKit

final class FeedViewController: UIViewController {
    private lazy var fakeBookView: FeedView = {
        let fakeBookView = FeedView()
        fakeBookView.delegate = self
        return fakeBookView
    }()
    private lazy var rightBarButtonItems: [UIBarButtonItem] = {
        let search = UIBarButtonItem()
        search.image = .search
        let configuration = UIBarButtonItem()
        configuration.image = .lines
        return [configuration, search]
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension FeedViewController: Setup {
    func configure() {
        Task {
            await Network.put(Post(perfilImage: "Gatsu",
                                   image: nil,
                                   name: "Gatsu",
                                   description: "\tSó me sinto vivo quando estou usando a minha espada.",
                                   id: "3",
                                   likes: 3,
                                   comments: 2,
                                   shares: 1),
                             from: URL(string: "https://62baed237bdbe01d52938975.mockapi.io/api/FakeBookPosts/3"))
        }
        
        view = fakeBookView
        title = "\(type(of: self))".removeLast(13)
        navigationItem.rightBarButtonItems = rightBarButtonItems
    }
}

extension FeedViewController: FeedViewDelegate {
    func fakeBookView(willComment post: Post?) -> UIAction? {
        return UIAction {_ in
            self.navigationController?.navigate(to: CommentViewController(post))
        }
    }
}
