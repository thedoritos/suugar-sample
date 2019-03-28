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
import RxSwift
import RxCocoa

class TodoListViewController: UIViewController {
    private weak var table: UITableView!

    private var todoList: [Todo] = [
        Todo(id: "0", title: "Shirobako"),
        Todo(id: "1", title: "Tari Tari"),
        Todo(id: "2", title: "Hanasaku Iroha")
    ]

    private let disposeBag = DisposeBag()

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
                let safeArea = $0.superview!.safeAreaLayoutGuide
                $0.freeFrame()
                $0.size(56)
                $0.Right == safeArea.Right - 16
                $0.Bottom == safeArea.Bottom - 16

                $0.setImage(UIImage(named: "baseline_add_white_24pt"), for: .normal)

                $0.rx.tap
                    .subscribe { [unowned self] _ in self.openCreateForm() }
                    .disposed(by: disposeBag)
            }
        }
    }

    private func openCreateForm() {
        let form = TodoFormViewController()
        navigationController?.pushViewController(form, animated: true)
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
