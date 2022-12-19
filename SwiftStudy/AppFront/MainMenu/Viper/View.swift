//
//  View.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 19/12/22.
//

import UIKit

protocol AnyView {
    var presenter: AnyPresenter? {get set}
    func update(with users: [User])
    func update(with error: String)
}

class UserViewController: UIViewController, AnyView {
    var presenter: AnyPresenter?
    private let table: (view: UITableView, cellIdentifier: String) = {
        let tableView = UITableView()
        let identifier = "Cell"
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: identifier)
        tableView.isHidden = true
        return (view: tableView, cellIdentifier: identifier)
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .reverseDark
        table.view.delegate = self
        table.view.dataSource = self
    }
    func update(with users: [User]) {
        
    }
    func update(with error: String) {
        
    }
}

extension UserViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: table.cellIdentifier,
                                             for: indexPath)
    }
}
