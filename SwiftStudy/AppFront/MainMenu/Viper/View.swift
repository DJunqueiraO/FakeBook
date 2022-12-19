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
        return (view: tableView, cellIdentifier: identifier)
    }()
    var users: [User] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .reverseDark
        view.addSubview(table.view)
        table.view.delegate = self
        table.view.dataSource = self
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        table.view.enableAutoLayout
            .constraint(attributes: [.top, .leading, .trailing, .bottom],
                        to: view.safeAreaLayoutGuide)
    }
    func update(with users: [User]) {
        DispatchQueue.main.async {
            self.users = users
            self.table.view.reloadData()
        }
    }
    func update(with error: String) {
        print(error)
    }
}

extension UserViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: table.cellIdentifier,
                                                 for: indexPath)
        let label = Create.element.label(users[indexPath.row].name ?? "")
        label.backgroundColor = .reverseDark
        cell.contentView.addSubview(label)
        label.enableAutoLayout
            .constraint(attributes: [.leading, .centerY])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height*0.1
    }
}
