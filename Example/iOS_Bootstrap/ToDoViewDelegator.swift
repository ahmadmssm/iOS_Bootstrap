//
//  ToDoViewDelegator.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 12/21/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

protocol ToDoViewDelegator: BaseViewDelegate {
    func newToDoDidCreated()
    func toDoDidUpdated()
    func toDoDidDeleted()
    func onError(error: String)
}
