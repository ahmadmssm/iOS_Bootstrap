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
    private var alert: SCLAlertView!
    
    convenience init(mode: ToDoMode) {
        self.init()
        self.mode = mode
    }
        
    override func viewDidLoad() { super.viewDidLoad() }
    
    override func initUI() {
        alert = SCLAlertView()
    }
    
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
        switch mode {
        case .Active:
            getPresenter().getActiveTodos()
            break
        case .Done:
            getPresenter().getFinishedTodos()
            break
        default: break
        }
    }
    
    override func initTableViewAdapterConfiguraton() {
        super.initTableViewAdapterConfiguraton(tableView: tableView, delegate: self)
    }
    
    func configureCellForRow(tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ToDoCell = initCell(indexPath: indexPath)
        return cell
    }
 
    func rowDidSelected(tableView: UITableView, indexPath: IndexPath) {
        getPresenter().getToDoWithIndex(index: indexPath.row)
    }

    @IBAction func createNewListButton(_ sender: CustomButton) {
        getCreateNewToDoPopUp().showEdit("Create new todo", subTitle: "")
    }
    
    func newToDoDidCreated() { alert.showSuccess("", subTitle: "ToDo created successfully") }
    
    func didGetSavedToDo(toDo: ToDoCellModel) {
        
    }
    
    func onError(error: String) { alert.showError("Error", subTitle: error) }
    
}
