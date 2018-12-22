//
//  ToDoCell.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 12/21/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

class ToDoCell: BaseTableViewCell {
    @IBOutlet weak var todoNameLabel: UILabel!
    @IBOutlet weak var toDoDate: UILabel!
    @IBOutlet weak var markAsDoneSwitch: UISwitch!
}
