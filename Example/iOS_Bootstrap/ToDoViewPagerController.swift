//
//  ToDoViewPagerController.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 12/21/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

class ToDoViewPagerController:
                        MyMenuItemViewPagerController <BasePresenter<BaseViewDelegator>,
                        BaseViewDelegator> {

    override func viewDidLoad() { super.viewDidLoad() }
    
    override func initUI() {
        // Setup view pager
        let activeTodos = ToDoViewController(mode: ToDoMode.Active)
        activeTodos.title = "Active todos"
        let doneTodos = ToDoViewController(mode: ToDoMode.Done)
        doneTodos.title = "Done todos"
        viewControllers = [activeTodos, doneTodos]
    }
    
}
