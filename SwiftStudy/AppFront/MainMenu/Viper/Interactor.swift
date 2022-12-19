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
        
    }
}
