//
//  TodoListViewModel.swift
//  SuugarSample
//
//  Created by thedoritos on 2019/03/26.
//

import RxSwift
import RxCocoa

class TodoListViewModel {
    let todoList = BehaviorRelay(value: [String]())
}
