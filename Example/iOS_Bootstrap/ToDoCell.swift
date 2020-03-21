//
//  ToDoCell.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 12/21/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

class ToDoCell: BaseGenericTableViewCell<ToDoCellModel> {
    
    @IBOutlet private weak var todoNameLabel: UILabel!
    @IBOutlet private weak var toDoDate: UILabel!
    @IBOutlet private weak var markAsDoneSwitch: UISwitch!
    
    override func initCellFrom(cellModel: ToDoCellModel) {
        if let title = cellModel.name { todoNameLabel.text = "Todo name " + title }
        if let date = cellModel.createdAt { toDoDate.text = date }
        if let isDone = cellModel.isDone {
            markAsDoneSwitch.addTarget(self, action: #selector(switchValueDidChange(_:)), for: .valueChanged)
            markAsDoneSwitch.isOn = isDone
        }
    }
    
    @objc private func switchValueDidChange(_ sender: UISwitch) {
        cellModel?.isDone = sender.isOn
        var event: String = Constants.doneToDoEvent
        if (sender.isOn) { event = Constants.activeToDoEvent }
        EventBus.post(event, sender: cellModel)
    }
    
    deinit { EventBus.unregister(self) }
}
