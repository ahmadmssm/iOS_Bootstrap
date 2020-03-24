//
//  ToDoRepo.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 3/13/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import RxSwift
import Resolver

class ToDoRepo {
    
    @LazyInjected private var toDoListManager: ToDoListCachingManager
        
    func createNewToDo(name: String) -> Completable {
        return toDoListManager
            .getIncrementalToDoId()
            .map { id -> ToDoListEntity in
                let toDoEntity: ToDoListEntity = ToDoListEntity()
                toDoEntity.name = name
                toDoEntity.createdAt = DateTimeHelpers.getCurrentDate()
                toDoEntity.id = id
                return toDoEntity
            }
            .asObservable()
            .flatMap { newToDo in self.toDoListManager.addNewToDo(toDo: newToDo) }
            .asCompletable()
    }
    
    func updateToDo(toDo: ToDoCellModel) -> Completable {
        return toDoListManager.updateToDo(toDo: toDo.getToDoCellEntity())
    }
    
    func getToDos(mode: ToDoMode) -> Single<[ToDoCellModel]> {
        switch mode {
            case .Active: return getActiveToDos()
            case .Done: return getDoneToDos()
        }
    }
    
    private func getActiveToDos() -> Single<[ToDoCellModel]> {
        return toDoListManager
            .getActiveToDos()
            .map({ toDoEntityList -> [ToDoCellModel] in
                return toDoEntityList.map { toDo -> ToDoCellModel in
                    return toDo.getToDoCellModel()
                }
            })
    }
    
    private func getDoneToDos() -> Single<[ToDoCellModel]> {
        return toDoListManager.getFinishedToDos()
            .map({ toDoEntityList -> [ToDoCellModel] in
                return toDoEntityList.map { toDo -> ToDoCellModel in
                    return toDo.getToDoCellModel()
                }
            })
    }
    
    func deleteToDo(toDo: ToDoCellModel, forMode: ToDoMode) -> Completable {
        let predicate = NSPredicate(format: "id == %d", toDo.id!)
        return toDoListManager.deleteRecord(with: predicate)
    }
}
