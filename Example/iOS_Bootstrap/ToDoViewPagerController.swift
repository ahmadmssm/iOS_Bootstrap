//
//  ToDoViewPagerController.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 12/21/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

class ToDoViewPagerController: DTPagerController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "ToDo list"
        // Setup view pager
        let activeTodos = ToDoViewController(mode: ToDoMode.Active)
        activeTodos.title = "Active todos"
        let doneTodos = ToDoViewController(mode: ToDoMode.Done)
        doneTodos.title = "Done todos"
        viewControllers = [activeTodos, doneTodos]
        pageScrollView.isScrollEnabled = false
    }
}
