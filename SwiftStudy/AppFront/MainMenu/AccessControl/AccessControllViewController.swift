//
//  AccessControllViewController.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 14/12/22.
//

import UIKit

class AccessControlViewController: UIViewController {
    fileprivate func printLero() {
        print("Lero Lero")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        FilePrivateObject().callLero()
        setup()
    }
}

extension AccessControlViewController: Setup {
    func configure() {
        view.backgroundColor = .green
    }
}

class FilePrivateObject {
    let accessControlViewController = AccessControlViewController()
    func callLero() {
        accessControlViewController.printLero()
    }
}
