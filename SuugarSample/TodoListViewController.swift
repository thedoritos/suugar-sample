//
//  TodoListViewController.swift
//  SuugarSample
//
//  Created by thedoritos on 2019/03/24.
//

import UIKit
import Suugar
import Stevia
import MaterialComponents

class TodoListViewController: UIViewController {
    private weak var table: UITableView!

    private var todoList: [Todo] = [
        Todo(id: "0", title: "Shirobako"),
        Todo(id: "1", title: "Tari Tari"),
        Todo(id: "2", title: "Hanasaku Iroha")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "TODO:"

        ui {
            $0.backgroundColor = .white

            $0.table {
                $0.freeFrame()
                $0.fillContainer()

                $0.estimatedRowHeight = UITableView.automaticDimension
                $0.register(UITableViewCell.self, forCellReuseIdentifier: "Todo")
                $0.dataSource = self
            }

            $0.composite(of: MDCFloatingButton.self) {
                let safeArea = self.view.safeAreaLayoutGuide
                $0.freeFrame()
                $0.size(56)
                $0.Right == safeArea.Right - 16
                $0.Bottom == safeArea.Bottom - 16

                $0.setImage(UIImage(named: "baseline_add_white_24pt"), for: .normal)
            }
        }
    }
}

extension TodoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Todo", for: indexPath)

        let todo = todoList[indexPath.row]
        cell.textLabel?.text = todo.title

        return cell
    }
}
