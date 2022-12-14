//
//  ViewController.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 14/12/22.
//

import UIKit

class MainMenuViewController: UIViewController {
    private let viewControllers = [AccessControlViewController()]
    private lazy var table: (view: UITableView, cellIdedntifier: String) = {
        let tableView = UITableView()
        tableView.backgroundColor = .red
        tableView.delegate = self
        tableView.dataSource = self
        let identifier = "Cell"
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: identifier)
        return (view: tableView, cellIdedntifier: identifier)
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension MainMenuViewController: Setup {
    func configure() {
        view.backgroundColor = .blue
        view.addSubview(table.view)
    }
    func constrain() {
        table.view.enableAutoLayout
            .constraint(attributes: [.top, .leading, .trailing, .bottom],
                        to: view.safeAreaLayoutGuide)
    }
}

extension MainMenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(viewControllers[indexPath.row],
                                                 animated: true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewControllers.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: table.cellIdedntifier,
                                                 for: indexPath)
        cell.backgroundColor = .yellow
        let label = Create.label("\(type(of: viewControllers[indexPath.row]))")
        cell.contentView.addSubview(label)
        label.enableAutoLayout
            .constraint(attributes: [.centerX, .centerY])
        return cell
    }
}
