//
//  Presenter.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 19/12/22.
//

import Foundation

protocol AnyPresenter {
    var router: AnyRouter? {get set}
    var interactor: AnyInteractor? {get set}
    var view: AnyView? {get set}
    func interactorDidFetchUsers(with result: Result<[User], Error>)
}

class UserPresenter: AnyPresenter {
    var router: AnyRouter?
    var interactor: AnyInteractor?
    var view: AnyView?
    func interactorDidFetchUsers(with result: Result<[User], Error>) {
        
    }
}
