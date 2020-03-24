//
//  ToDosTableAdapter.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 3/13/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

class ToDosTableAdapter: BaseTableViewAdapter<UITableView, ToDoCellModel>, ToDoCellDelegate {
    
    private var toDosTableAdapterDelegate: ToDosTableAdapterDelegate!
    
    convenience init(tableView: UITableView,
                     toDosTableAdapterDelegate: ToDosTableAdapterDelegate) {
        self.init(tableView: tableView, xibCell: ToDoCell.self)
        self.toDosTableAdapterDelegate = toDosTableAdapterDelegate
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = initCell(cell: ToDoCell.self, indexPath: indexPath)
        cell.setDelegate(delegate: self)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        toDosTableAdapterDelegate.didDeleteToDoAt(indexPath: indexPath, toDo: dataSource[indexPath.row])
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (action, view, nil) in
            let toDo = self.dataSource[indexPath.row]
            self.toDosTableAdapterDelegate.didDeleteToDoAt(indexPath: indexPath, toDo: toDo)
        }
        let swipeActionConfig = UISwipeActionsConfiguration(actions: [delete])
        swipeActionConfig.performsFirstActionWithFullSwipe = false
        return swipeActionConfig
    }
    
    override func emptyDataSetShouldDisplay(_ scrollView: UIScrollView) -> Bool {
        return self.dataSource.isEmpty
    }
    
    override func buttonImage(forEmptyDataSet scrollView: UIScrollView, for state: UIControl.State) -> UIImage? {
        return #imageLiteral(resourceName: "empty_box")
    }
    
    override func description(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString? {
        return emptyDataSetDescriptionText()
    }
    
    private func emptyDataSetDescriptionText() -> NSAttributedString {
        let attributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.strokeColor : UIColor.black,
            NSAttributedString.Key.foregroundColor : UIColor.blue,
            NSAttributedString.Key.strokeWidth : -2.0,
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)
        ]
        return NSAttributedString(string: "No data !", attributes: attributes)
    }
    
    override func emptyDataSet(_ scrollView: UIScrollView, didTapButton button: UIButton) {
        toDosTableAdapterDelegate.reload()
    }
    
    func didUpdate(toDo: ToDoCellModel) {
        toDosTableAdapterDelegate.didUpdate(toDo: toDo)
    }
}
