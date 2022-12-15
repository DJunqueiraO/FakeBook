//
//  Facebook.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 15/12/22.
//

import UIKit

final class FakeBookViewController: UIViewController {
    private lazy var rightBarButtonItems: [UIBarButtonItem] = {
        let search = UIBarButtonItem()
        search.image = Assets.Images.search
        let configuration = UIBarButtonItem()
        configuration.image = Assets.Images.lines
        return [configuration, search]
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension FakeBookViewController: Setup {
    func configure() {
        view = FakeBookView(frame: view.frame)
        title = "\(type(of: self))".removeLast(0...13)
        navigationItem.rightBarButtonItems = rightBarButtonItems
    }
}
