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
    
    func addNewToDo(toDo: ToDoListEntity) -> Completable { return insertRecord(record: toDo) }
    
    func getActiveToDos() -> Single<[ToDoListEntity]> {
        return getRecordsFilteredBy(filter: "isDone = false")
    }
    
    func getFinishedToDos() -> Single<[ToDoListEntity]> {
        return getRecordsFilteredBy(filter: "isDone = true")
    }
    
    func getToDosSortedByRecentDate() -> Single<[ToDoListEntity]> {
        return Single.create { single in
            do {
                let results = self.getRealm().objects(ToDoListEntity.self).sorted(byKeyPath: "createdAt", ascending: false)
                single(.success(results.toArray()))
            }
            return Disposables.create()
        }
    }
    
    func getToDosSortedById() -> Single<[ToDoListEntity]> {
        return Single.create { single in
            do {
                let results = self.getRealm().objects(ToDoListEntity.self).sorted(byKeyPath: "id", ascending: true)
                single(.success(results.toArray()))
            }
            return Disposables.create()
        }
    }
    
    func getIncrementalToDoId() -> Maybe<Int> {
        return getToDosSortedById().map({ toDoEntityList -> Int in
            var id: Int = 0
            if (toDoEntityList.count > 0 && toDoEntityList.last != nil) {
                id = (toDoEntityList.last?.id)! + 1
            }
            return id
        }).asMaybe()
    }
    
    func getAllTodos() -> Single<[ToDoListEntity]> { return getAllRecords() }
    
    func updateToDo(toDo: ToDoListEntity) -> Completable { return updateRecord(record: toDo) }

    func deleteToDo(toDo: ToDoListEntity) -> Completable { return deleteRecord(record: toDo) }
}
