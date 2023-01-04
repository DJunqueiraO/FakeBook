//
//  EndPoints.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 03/01/23.
//

import Foundation

extension URL {
    static var fakeBookPosts: URL? {URL(string: "https://62baed237bdbe01d52938975.mockapi.io/api/FakeBookPosts")}
    static func fakeBookPosts(_ id: String) -> URL? {
        return URL(string: "https://62baed237bdbe01d52938975.mockapi.io/api/FakeBookPosts/\(id)")
    }
}
