//
//  ToDoCell.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 12/21/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

class ToDoCell: BaseTableViewCellV2<ToDoCellModel> {
    
    @IBOutlet private weak var todoNameLabel: UILabel!
    @IBOutlet private weak var toDoDate: UILabel!
    @IBOutlet private weak var markAsDoneSwitch: UISwitch!
    
    override func initCellFrom(cellModel: ToDoCellModel) {
        if let title = cellModel.name { todoNameLabel.text = title }
        if let date = cellModel.createdAt { toDoDate.text = date }
        if let isActive = cellModel.isDone { markAsDoneSwitch.isOn = !isActive }
    }
    
}
