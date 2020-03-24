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
    }
    
    open override func initPresenter () -> ToDoPresenter? {
        return ToDoPresenter(viewDelegate: self, mode: mode)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toDosTableAdapter = ToDosTableAdapter(tableView: tableView, toDosTableAdapterDelegate: self)
    }
        
    override func localizeStrings() {
        
    }
    
    func reload() {
        self.getPresenter().reloadFromScratch()
    }
    
    func didUpdate(toDo: ToDoCellModel) {
        self.getPresenter().update(toDo: toDo)
    }
    
    func didDeleteToDoAt(indexPath: IndexPath, toDo: ToDoCellModel) {
        self.getPresenter().delete(toDo: toDo, mode: mode)
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
    
    func didDeleteToDo() {
        showSuccess(message: "ToDo deleted successfully")
    }
    
    @IBAction private func createNewToDo(_ sender: UIButton) {
        dialogs.showCreateToDoAlertDialog(viewController: self) { [weak self] title, details in
            self?.getPresenter().createNewToDo(name: title)
        }
    }
}
