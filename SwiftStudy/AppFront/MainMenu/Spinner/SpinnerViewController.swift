//
//  SpinnerViewController.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 14/12/22.
//

import UIKit

final class SpinnerViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    private func exercice() {
        let array = [1,2,3,4,5,6]
        print(array.map{$0 + 1})
    }
}

extension SpinnerViewController: Setup {
    func configure() {
        view = SpinnerView()
        exercice()
    }
}
