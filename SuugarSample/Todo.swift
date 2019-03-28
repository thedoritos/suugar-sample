//
//  Todo.swift
//  SuugarSample
//
//  Created by thedoritos on 2019/03/26.
//

import Foundation
import RxDataSources

struct Todo {
    let id: String
    let title: String
}

extension Todo: Equatable {}
extension Todo: IdentifiableType {
    var identity: String { return id }
}
