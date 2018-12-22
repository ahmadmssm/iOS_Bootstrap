//
//  ToDoListCachingManager.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 12/21/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import RxSwift

class ToDoListCachingManager: RealmManager<ToDoListEntity> {
    
    required init() { super.init() }
    
    func addNewToDo(toDo: ToDoListEntity) { self.insertRecord(record: toDo) }
    
    func getAllTodos() -> Observable<[ToDoListEntity]> { return getAllRecords() }

}
