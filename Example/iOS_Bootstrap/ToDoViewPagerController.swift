////
////  ToDoViewPagerController.swift
////  iOS_Bootstrap_Example
////
////  Created by Ahmad Mahmoud on 12/21/18.
////  Copyright © 2018 CocoaPods. All rights reserved.
////
//
//import iOS_Bootstrap
//
//class ToDoViewPagerController:
//                        MyMenuItemViewPagerController
//                                    <BasePresenter<BaseViewDelegate>, BaseViewDelegate> {
//
//    override func viewDidLoad() { super.viewDidLoad() }
//    
//    override func initUI() {
//        self.title = "ToDo list"
//        
//        // Setup view pager
//        let activeTodos = ToDoViewController(mode: ToDoMode.Active)
//        activeTodos.title = "Active todos"
//        let doneTodos = ToDoViewController(mode: ToDoMode.Done)
//        doneTodos.title = "Done todos"
//        viewControllers = [activeTodos, doneTodos]
//    }
//    
//    override func localizeStrings() {}
//    
//}
