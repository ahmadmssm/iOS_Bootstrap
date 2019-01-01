//
//  ToDoViewController.swift.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 12/21/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import iOS_Bootstrap
import SCLAlertView

class ToDoViewController:
            MyMenuItemLiveTableViewControllerV2
                   <ToDoPresenter, ToDoViewDelegator,
                    ToDoCellModel, ToDoCell>, ToDoViewDelegator, BaseTableViewDelegates {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var mode: ToDoMode!
    
    convenience init(mode: ToDoMode) {
        self.init()
        self.mode = mode
        listenForToDoCellEvent(forMode: mode)
    }
    
    private func listenForToDoCellEvent(forMode: ToDoMode) {
        var event: String!
        switch self.mode {
        case .Active:
            event = Constants.activeToDoEvent
            break
        case .Done:
            event = Constants.doneToDoEvent
            break
        default: break
        }
        EventBus.onMainThread(self, name: event) { result in
            let toDo: ToDoCellModel = result!.object as! ToDoCellModel
            self.getPresenter().updateToDo(toDo: toDo, forMode: self.mode)
        }
    }
    
    override func viewDidLoad() { super.viewDidLoad() }
    
    override func initUI() {}
    
    deinit { EventBus.unregister(self) }
    
    private func getCreateNewToDoPopUp() -> SCLAlertView {
        let poUpAppearance = SCLAlertView.SCLAppearance (showCloseButton: false, shouldAutoDismiss: false)
        let popUp = SCLAlertView(appearance: poUpAppearance)
        let toDoNameField = popUp.addTextField("Enter your ToDo name")
        popUp.addButton("Create") {
            if (toDoNameField.text?.isEmpty)! {
                self.view.makeToast("To do name can not be empty!", duration: 3.0, position: .top)
            }
            else {
                self.getPresenter().createNewToDo(name: toDoNameField.text!)
                popUp.hideView()
            }
        }
        popUp.addButton("close") { popUp.hideView() }
        return popUp
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getPresenter().getToDos(mode: mode)
    }
    
    override func initTableViewAdapterConfiguraton() {
        super.initTableViewAdapterConfiguraton(tableView: tableView, delegate: self)
    }
    
    func configureCellForRow(tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ToDoCell = initCell(indexPath: indexPath)
        return cell
    }
 
    func canEditRow() -> Bool { return true }
    
    @available(iOS 11.0, *)
    func configureSwipAction(tableView: UITableView, indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (action, view, nil) in
            self.removeToDoAtRow(index: indexPath.row)
        }
        let swipeActionConfig = UISwipeActionsConfiguration(actions: [delete])
        swipeActionConfig.performsFirstActionWithFullSwipe = false
        return swipeActionConfig
    }
    
    func emptyDataSetShouldDisplay() -> Bool { return self.isEmptyDataSource }
    
    func emptyDataSetDescriptionText() -> NSAttributedString {
        let attributes: [NSAttributedStringKey : Any] = [
            NSAttributedStringKey.strokeColor : UIColor.black,
            NSAttributedStringKey.foregroundColor : UIColor.blue,
            NSAttributedStringKey.strokeWidth : -2.0,
            NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 18)
        ]
        return NSAttributedString(string: "No data !", attributes: attributes)
    }
    
    @IBAction func createNewListButton(_ sender: CustomButton) {
        getCreateNewToDoPopUp().showEdit("Create new todo", subTitle: "")
    }
    
    func newToDoDidCreated() {
        SCLAlertView().showSuccess("", subTitle: "ToDo created successfully")
    }
    
    func toDoDidUpdated() {
        SCLAlertView().showSuccess("", subTitle: "ToDo updated successfully")
    }
    
    func toDoDidDeleted() {
        SCLAlertView().showSuccess("", subTitle: "ToDo deleted successfully")
    }
    
    func onError(error: String) {
        SCLAlertView().showError("Error", subTitle: error)
    }
    
    func removeToDoAtRow(index: Int) { getPresenter().deleteToDoByIndex(index, mode) }
    
}
