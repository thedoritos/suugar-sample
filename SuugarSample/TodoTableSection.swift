//
//  TodoTableSection.swift
//  SuugarSample
//
//  Created by thedoritos on 2019/03/26.
//

import RxDataSources

struct TodoTableSection {
    var items: [Item]
}

extension TodoTableSection: AnimatableSectionModelType {
    typealias Item = Todo
    var identity: String { return "TodoTableSectionId" }

    init(original: TodoTableSection, items: [Item]) {
        self = original
        self.items = items
    }
}
