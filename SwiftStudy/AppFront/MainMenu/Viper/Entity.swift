//
//  Entity.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 19/12/22.
//

import Foundation

struct User: Codable {
    struct Address: Codable {
        struct Geo: Codable {
            let lat, lng: String?
        }
        let street, suite, city, zipcode: String?
        let geo: Geo?
    }
    struct Company: Codable {
        let name, catchPhrase, bs: String?
    }
    let id: Int?
    let name, username, email, phone, website: String?
    let address: Address?
    let company: Company?
}
