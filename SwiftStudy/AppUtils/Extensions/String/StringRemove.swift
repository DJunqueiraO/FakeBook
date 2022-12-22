//
//  StringIndex.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 14/12/22.
//

import Foundation

extension String {
    func removeLast(_ times: Int) -> String {
        var result = self
        for _ in 0...times {
            result.removeLast()
        }
        return result
    }
    func removeFirst(_ times: Int) -> String {
        var result = self
        for _ in 0...times {
            result.removeFirst()
        }
        return result
    }
}
