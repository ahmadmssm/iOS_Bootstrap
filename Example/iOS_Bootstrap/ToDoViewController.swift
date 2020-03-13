//
//  ToDoViewController.swift.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 12/21/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

class ToDoViewController:
                    AppViewController<ToDoPresenter, ToDoViewDelegate>,
                    ToDoViewDelegate,
                    ToDosTableAdapterDelegate {
    
    @IBOutlet private weak var tableView: UITableView!
    private var toDosTableAdapter: ToDosTableAdapter!
    private var mode: ToDoMode!
    
    convenience init(mode: ToDoMode) {
        self.init()
        self.mode = mode
        listenForToDoCellEvent(forMode: mode)
    }
    
    private func listenForToDoCellEvent(forMode: ToDoMode) {
        var event: String!
        switch self.mode {
        case .Active?:
            event = Constants.activeToDoEvent
            break
        case .Done?:
            event = Constants.doneToDoEvent
            break
        default: break
        }
        EventBus.onMainThread(self, name: event) { result in
            let toDo: ToDoCellModel = result!.object as! ToDoCellModel
            // self.getPresenter().updateToDo(toDo: toDo, forMode: self.mode)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toDosTableAdapter = ToDosTableAdapter(tableView: tableView, toDosTableAdapterDelegate: self)
    }
        
    override func localizeStrings() {
        
    }
    
    func didSelectRow(indexPath: IndexPath) {

    }
    
    func didGetAllToDos(toDos: [ToDoCellModel]) {
        toDosTableAdapter.reloadSinglePageTable(items: toDos)
    }
    
    func didCreateNewToDo() {
        showSuccess(message: "ToDo created successfully")
    }
    
    func didUpdateToDo() {
        showSuccess(message: "ToDo updated successfully")
    }
    
    func toDoDidDeleted() {
        showSuccess(message: "ToDo deleted successfully")
    }
    
    func onError(error: String) {
        showError(errorMessage: error)
    }
    
    func removeToDoAtRow(index: Int) {
        // getPresenter().deleteToDoByIndex(index, mode)
    }
    
    @IBAction private func createNewListButton(_ sender: UIButton) {
        //  getCreateNewToDoPopUp().showEdit("Create new todo", subTitle: "")
    }
    
    deinit { EventBus.unregister(self) }
}
