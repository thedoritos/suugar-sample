//
//  TodoListViewController.swift
//  SuugarSample
//
//  Created by thedoritos on 2019/03/24.
//

import UIKit
import Suugar
import MaterialComponents
import Stevia
import RxSwift
import RxCocoa

class TodoListViewController: UIViewController {
    private weak var table: UITableView!
    private let disposeBag = DisposeBag()

    private var todoList: [String] = [
        "Shirobako",
        "Tari Tari",
        "Hanasaku Iroha",
        "Angel Beats!",
        "The Eccentric Family",
        "True Tears",
        "Glasslip"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "TODO:"

        ui {
            $0.backgroundColor = .white

            table = $0.table {
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

                $0.rx.tap.subscribe { [unowned self] _ in
                    self.todoList = ["New Anime"] + self.todoList
                    let indexPath = IndexPath(row: 0, section: 0)
                    self.table.insertRows(at: [indexPath], with: .fade)
                }.disposed(by: disposeBag)
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
        cell.textLabel?.text = todo

        return cell
    }
}
