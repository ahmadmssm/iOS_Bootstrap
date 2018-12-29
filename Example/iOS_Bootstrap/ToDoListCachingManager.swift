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
    
    func getActiveToDos() -> Observable<[ToDoListEntity]> {
        return getRecordsFilteredBy(filter: "isDone = false")
    }
    
    func getFinishedToDos() -> Observable<[ToDoListEntity]> {
        return getRecordsFilteredBy(filter: "isDone = true")
    }
    
    func getToDosSortedByRecentDate() -> Observable<[ToDoListEntity]> {
        return Observable.create { observer in
            do {
                let results = self.getRealm().objects(ToDoListEntity.self).sorted(byKeyPath: "createdAt", ascending: false)
                observer.onNext(results.toArray())
            }
            observer.on(.completed)
            return Disposables.create()
        }
    }
    
    func getToDosSortedById() -> Observable<[ToDoListEntity]> {
        return Observable.create { observer in
            do {
                let results = self.getRealm().objects(ToDoListEntity.self).sorted(byKeyPath: "id", ascending: true)
                observer.onNext(results.toArray())
            }
            observer.on(.completed)
            return Disposables.create()
        }
    }
    
    func getLatestToDoId() -> Maybe<Int> {
        return getToDosSortedById().map({ toDoEntityList -> Int in
            var id: Int = 0
            if (toDoEntityList.count > 0 && toDoEntityList.last != nil) {
                id = (toDoEntityList.last?.id)! + 1
            }
            return id
        }).asMaybe()
    }
    
    func getAllTodos() -> Observable<[ToDoListEntity]> { return getAllRecords() }
    
    func updateToDo(toDo: ToDoListEntity) -> Completable { return updateRecord(record: toDo) }

    func deleteToDo(toDo: ToDoListEntity) -> Completable { return deleteRecord(record: toDo) }
    
}
