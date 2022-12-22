//
//  StaticViewController.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 14/12/22.
//

import UIKit

final class DataSourceViewController: UIViewController {
    private let tableView = DiffableDataSourceTableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    @objc private func addVideo() {
        let actionSheet = Create.element.alert(title: "Lero", message: " Lero", preferredStyle: .actionSheet)
        for counter in 0...10 {
            actionSheet.addAction(
                UIAlertAction(title: "Lero \(counter+1)", style: .default) {[weak self]_ in
                    let video = Video(title: "Lero \(counter+1)", count: counter+1)
                    self?.tableView.videos.append(video)
                }
            )
        }
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(actionSheet, animated: true)
    }
}

extension DataSourceViewController: Setup {
    func configure() {
        title  = "Lero Lero"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: .plus,
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(addVideo))
        view.backgroundColor = .systemPurple
        view.addSubview(tableView)
    }
    func constrain() {
        tableView.enableAutoLayout
            .constraint(attributes: [.top, .leading, .trailing, .bottom], to: view.safeAreaLayoutGuide)
    }
}
