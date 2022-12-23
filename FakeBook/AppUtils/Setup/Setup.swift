//
//  Setup.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 14/12/22.
//

import Foundation

protocol Setup {
    func configure()
    func constrain()
}

extension Setup {
    func constrain() {}
    func setup() {
        configure()
        constrain()
    }
}
