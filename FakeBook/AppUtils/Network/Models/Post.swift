//
//  FakeBookPost.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 16/12/22.
//

import Foundation

typealias Posts = [Post]

struct Post: Codable {
    let perfilImage, image, name, description, id: String?
    var likes, shares: Int?
    var comments: [String]?
}
