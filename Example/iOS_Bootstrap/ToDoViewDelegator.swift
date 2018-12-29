//
//  ToDoViewDelegator.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 12/21/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

protocol ToDoViewDelegator: BaseViewDelegator {
    func newToDoDidCreated()
    func didGetSavedToDo(toDo: ToDoCellModel)
    func onError(error: String)
}
