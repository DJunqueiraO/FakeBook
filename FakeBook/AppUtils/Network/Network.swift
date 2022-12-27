//
//  Network.swift
//  News
//
//  Created by Josicleison on 10/10/22.
//

import Foundation

struct Network {
    static func call(from url: URL?) async -> (data: Data, response: String)? {
        guard let url = url else {print("ERROR: Wrong url"); return nil}
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            return (data: data, response: "RESPONSE: \(response)")
        } catch {print("ERROR: \(error)"); return nil}
    }
    static func decode<T: Codable>(_ model: T.Type, from data: Data) async -> T? {
        do {
            return try JSONDecoder().decode(model.self, from: data)
        } catch {print("ERROR: \(error): \(String(data: data, encoding: .ascii) ?? "?")"); return nil}
    }
    static func read<T: Codable>(_ what: T.Type, from file: String, type: String = "json") -> T? {
        guard let url = Bundle.main.url(forResource: file, withExtension: type) else {
            print("ERROR: File not found"); return nil
        }
        do {
            let data = try Data(contentsOf: url)
            let model = try JSONDecoder().decode(T.self, from: data)
            return model
        } catch {print("ERROR: \(error)"); return nil}
    }
    static func post<T: Codable>(_ model: T, from url: URL?) {
        guard let url = url else {return}
        let request = {(data: Data) -> URLRequest in
            var request = URLRequest(url: url)
            request.httpMethod = .post
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = data
            return request
        }
        do {
            let data = try JSONEncoder().encode(model)
            URLSession.shared.dataTask(with: request(data)).resume()
        } catch {print("ERROR: \(error)"); return}
    }
}
