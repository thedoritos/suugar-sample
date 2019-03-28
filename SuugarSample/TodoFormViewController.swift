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
import RxSwift
import RxCocoa

class TodoFormViewController: UIViewController {
    private weak var titleInput: MDCTextField!
    private weak var dueDateInput: MDCTextField!
    private weak var noteInput: MDCMultilineTextField!

    private var titleController: MDCTextInputControllerOutlined!
    private var dueDateController: MDCTextInputControllerOutlined!
    private var noteController: MDCTextInputControllerOutlinedTextArea!

    private let disposeBag = DisposeBag()

    private let applyPicker: SuugarFunc<UITextField, Disposable> = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let disposable = picker.rx.date
            .map { formatter.string(from: $0) }
            .bind(to: $0.rx.text)

        $0.inputView = picker

        let pickerToolbar = UIToolbar()
        pickerToolbar.sizeToFit()
        pickerToolbar.items = [
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
            UIBarButtonItem(title: "Done", style: .done, target: $0, action: #selector($0.resignFirstResponder))
        ]
        $0.inputAccessoryView = pickerToolbar

        return disposable
    }

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

                        dueDateInput = $0.composite() {
                            $0.placeholder = "Due Date"

                            applyPicker($0).disposed(by: disposeBag)
                        }

                        noteInput = $0.composite() {
                            $0.placeholder = "Note"
                        }
                    }
                }
            }
        }

        titleController = MDCTextInputControllerOutlined(textInput: titleInput)
        dueDateController = MDCTextInputControllerOutlined(textInput: dueDateInput)
        noteController = MDCTextInputControllerOutlinedTextArea(textInput: noteInput)
    }
}
