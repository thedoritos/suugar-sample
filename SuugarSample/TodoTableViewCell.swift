//
//  TodoTableViewCell.swift
//  SuugarSample
//
//  Created by thedoritos on 2019/03/26.
//

import UIKit
import Suugar

class TodoTableViewCell: UITableViewCell {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        render()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        render()
    }

    private func render() {
    }
}
