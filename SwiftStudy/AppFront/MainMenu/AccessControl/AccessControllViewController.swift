//
//  AccessControllViewController.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 14/12/22.
//

import UIKit

class AccessControlViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension AccessControlViewController: Setup {
    func configure() {
        view.backgroundColor = .green
    }
}
