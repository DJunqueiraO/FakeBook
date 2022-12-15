//
//  StringIndex.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 14/12/22.
//

import Foundation

extension String {
    func removeLast(_ interval: ClosedRange<Int>) -> String {
        var result = self
        for _ in interval {
            result.removeLast()
        }
        return result
    }
    func removeFirst(_ interval: ClosedRange<Int>) -> String {
        var result = self
        for _ in interval {
            result.removeFirst()
        }
        return result
    }
}
