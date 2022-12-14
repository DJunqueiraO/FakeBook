//
//  StaticViewController.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 14/12/22.
//

import UIKit

class StaticViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
//        let swiftNews    = Video(title: "Swift News", count: 5000)
        let vlog         = Video(title: "Mc Donalds", count: 15000)
//        let tutorial     = Video(title: "UITableView Tutorial", count: 10000)
        print(Video.creator)
        print(vlog.creatorSister)
    }
}

extension StaticViewController: Setup {
    func configure() {
        view.backgroundColor = .systemPurple
    }
}

