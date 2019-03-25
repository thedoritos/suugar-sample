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

class TodoListViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "TODO:"

        ui {
            $0.backgroundColor = .white

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
