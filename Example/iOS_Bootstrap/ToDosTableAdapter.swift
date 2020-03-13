//
//  ToDosTableAdapter.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 3/13/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

class ToDosTableAdapter: BaseTableViewAdapter<UITableView, ToDoCellModel> {
    
    private var toDosTableAdapterDelegate: ToDosTableAdapterDelegate!
    
    convenience init(tableView: UITableView,
                     toDosTableAdapterDelegate: ToDosTableAdapterDelegate) {
        self.init(tableView: tableView, xibCell: ToDoCell.self)
        self.toDosTableAdapterDelegate = toDosTableAdapterDelegate
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return initCell(cell: ToDoCell.self, indexPath: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        toDosTableAdapterDelegate.didSelectRow(indexPath: indexPath)
    }
    
    func canEditRow() -> Bool { return true }

//    @available(iOS 11.0, *)
//       func configureSwipAction(tableView: UITableView, indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//           let delete = UIContextualAction(style: .destructive, title: "Delete") { (action, view, nil) in
//               self.removeToDoAtRow(index: indexPath.row)
//           }
//           let swipeActionConfig = UISwipeActionsConfiguration(actions: [delete])
//           swipeActionConfig.performsFirstActionWithFullSwipe = false
//           return swipeActionConfig
//    }
//
//    func emptyDataSetShouldDisplay() -> Bool { return self.isEmptyDataSource }
    
    func emptyDataSetDescriptionText() -> NSAttributedString {
        let attributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.strokeColor : UIColor.black,
            NSAttributedString.Key.foregroundColor : UIColor.blue,
            NSAttributedString.Key.strokeWidth : -2.0,
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)
        ]
        return NSAttributedString(string: "No data !", attributes: attributes)
    }
}
