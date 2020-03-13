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
            .getLatestToDoId()
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
           return toDoListManager.updateToDo(toDo: getToToDoCellEntittFrom(toDo: toDo))
    }
    
    func changeToDoStatus(toDo: ToDoCellModel) -> Completable {
        toDoListManager
            .updateToDo(toDo: getToToDoCellEntittFrom(toDo: toDo))
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
                return self.getToDoCellModeslListFrom(toDoEntites: toDoEntityList)
            })
    }
    
    private func getDoneToDos() -> Single<[ToDoCellModel]> {
        return toDoListManager.getFinishedToDos()
            .map({ toDoEntityList -> [ToDoCellModel] in
                return self.getToDoCellModeslListFrom(toDoEntites: toDoEntityList)
            })
    }
    
    func deleteToDo(toDo: ToDoCellModel, forMode: ToDoMode) -> Completable {
        return toDoListManager.deleteToDo(toDo: getToToDoCellEntittFrom(toDo: toDo))
    }
        
    func deleteToDoByIndex(_ index: Int, _ mode: ToDoMode) -> Completable {
        toDoListManager
            .getRecordAtIndex(index: index).asObservable()
            .flatMap { toDoEntity in self.toDoListManager.deleteToDo(toDo: toDoEntity) }
            .asCompletable()
    }
    
    private func getToDoCellModeslListFrom(toDoEntites: [ToDoListEntity]) -> [ToDoCellModel] {
        var toDos: [ToDoCellModel] = []
        toDoEntites.forEach({ toDoEntity in
            var toDo = ToDoCellModel ()
            toDo.id = toDoEntity.id
            toDo.name = toDoEntity.name
            toDo.createdAt = DateTimeHelpers.getDateStringFromDate(date: toDoEntity.createdAt)
            toDo.isDone = toDoEntity.isDone
            toDos.append(toDo)
        })
        return toDos
    }
    
    private func getToToDoCellEntittFrom(toDo: ToDoCellModel) -> ToDoListEntity {
        let toDoEntity = ToDoListEntity()
        toDoEntity.id = toDo.id!
        toDoEntity.name = toDo.name!
        if let date = DateTimeHelpers.getDateFromDateString(dateString: toDo.createdAt!) {
            toDoEntity.createdAt = date
        }
        toDoEntity.isDone = toDo.isDone!
        return toDoEntity
    }
}
