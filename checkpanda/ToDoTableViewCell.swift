//
//  ToDoTableViewCell.swift
//  checkpanda
//
//  Created by Takagi Yuki on 2018/03/22.
//  Copyright © 2018年 checkpanda. All rights reserved.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setCell(todo: ToDo) {
        title.text = todo.title
    }
}

