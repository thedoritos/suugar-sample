//
//  TodoFormViewController.swift
//  SuugarSample
//
//  Created by thedoritos on 2019/03/26.
//

import UIKit
import Suugar
import Stevia
import MaterialComponents

class TodoFormViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        ui {
            $0.backgroundColor = .white

            $0.scrollView {
                $0.freeFrame()
                $0.fillContainer()

                // ContentView
                $0.view {
                    $0.freeFrame()
                    $0.fillContainer()
                    $0.Width == $0.superview!.Width
                }
            }
        }
    }
}
