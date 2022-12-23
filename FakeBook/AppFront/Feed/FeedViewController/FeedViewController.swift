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
