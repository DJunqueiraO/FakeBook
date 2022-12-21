//
//  ViewController.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 14/12/22.
//

import UIKit
import SwiftUI

final class MainMenuViewController: UIViewController {
    private let viewControllers = [AccessViewController(),
                                   StaticViewController(),
                                   ArrayViewController(),
                                   SpinnerViewController(),
                                   LoginViewController(),
//                                   UserRouter.start().entry as Any,
                                   FakeBookViewController()]
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
    override func viewDidDisappear(_ animated: Bool) {
        table.view.isUserInteractionEnabled = true
        super.viewDidDisappear(animated)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension MainMenuViewController: Setup {
    func configure() {
        title = "\(type(of: self))".removeLast(0...13)
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
        tableView.isUserInteractionEnabled = false
//        guard let viewController = viewControllers[indexPath.row] as? UIViewController else {return}
        navigationController?.pushViewController(viewControllers[indexPath.row], animated: true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewControllers.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: table.cellIdedntifier,
                                                 for: indexPath)
        cell.backgroundColor = .yellow
//        guard let viewController = viewControllers[indexPath.row] as? UIViewController else {return cell}
        let label = Create.element.label("\(type(of: viewControllers[indexPath.row]))".removeLast(0...13))
        label.textColor = .black
        cell.contentView.addSubview(label)
        label.enableAutoLayout
            .constraint(attributes: [.centerX, .centerY])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height*0.1
    }
}
