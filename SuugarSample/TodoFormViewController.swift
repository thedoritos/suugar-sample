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
    private weak var titleInput: MDCTextField!
    private weak var descriptionInput: MDCMultilineTextField!

    private var titleController: MDCTextInputControllerOutlined!
    private var descriptionController: MDCTextInputControllerOutlinedTextArea!

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

                    $0.vstack {
                        $0.freeFrame()
                        $0.fillContainer(16)

                        titleInput = $0.composite() {
                            $0.placeholder = "Title"
                        }

                        descriptionInput = $0.composite() {
                            $0.placeholder = "Note"
                        }
                    }
                }
            }
        }

        titleController = MDCTextInputControllerOutlined(textInput: titleInput)
        descriptionController = MDCTextInputControllerOutlinedTextArea(textInput: descriptionInput)
    }
}
