//
//  Interactor.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 19/12/22.
//

import Foundation

protocol AnyInteractor {
    var presenter: AnyPresenter? {get set}
    func getUsers()
}

class UserInteractor: AnyInteractor {
    var presenter: AnyPresenter?
    func getUsers() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {return}
        URLSession.shared.dataTask(with: url) {[weak self] data, response, error in
            guard let data = data, error == nil else {
                self?.presenter?.interactorDidFetchUsers(with: .failure(Errors.failed)); return
            }
            do {
                let entities = try JSONDecoder().decode([User].self, from: data)
                self?.presenter?.interactorDidFetchUsers(with: .success(entities)); return
            } catch {
                self?.presenter?.interactorDidFetchUsers(with: .failure(error)); return
            }
        }.resume()
    }
}
