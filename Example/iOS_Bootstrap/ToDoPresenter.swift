//
//  ToDoPresenter.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 12/21/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import iOS_Bootstrap
import RxSwift

class ToDoPresenter: BaseLiveListingPresenter<ToDoViewDelegator, ToDoCellModel> {
    
    private var toDoListManager: ToDoListCachingManager!
    private var disposeBag: DisposeBag!
    
    required init(viewDelegator: ToDoViewDelegator) {
        super.init(viewDelegator: viewDelegator)
        toDoListManager = ToDoListCachingManager()
        disposeBag = DisposeBag()
    }
    
    override func viewControllerWillRefresh() { self.reloadFromScratch() }
    
    func getToDos(mode: ToDoMode) {
        switch mode {
        case .Active:
            self.getActiveTodos()
            break
        case .Done:
            self.getDoneTodos()
            break
        }
    }
    
    // Create new toDo and get all active toDos
    func createNewToDo(name: String) {
        createNewToDoCompletable(name: name)
            .andThen(getActiveTodosObservable())
            .subscribe(onNext: { toDos in
                self.getViewDelegator().newToDoDidCreated()
                self.reloadFromScratch()
                self.dataSource = toDos
            }, onError: { error in
            self.getViewDelegator().onError(error: error.localizedDescription)
        }, onCompleted: {}) {}
            .disposed(by: disposeBag)
    }
    
    func updateToDo(toDo: ToDoCellModel, forMode: ToDoMode) {
        switch forMode {
        case .Active:
            markToDoAsDone(toDo: toDo)
            break
        case .Done:
            markToDoAsActive(toDo: toDo)
            break
        }
    }
    
    func deleteToDo(toDo: ToDoCellModel, forMode: ToDoMode) {
        toDoListManager
            .deleteToDo(toDo: transformToDoCellModelToToDoCellEntity(toDo: toDo))
            .andThen(getToDosObservable(mode: forMode))
            .subscribe(onNext: { toDos in
                self.getViewDelegator().toDoDidDeleted()
                self.reloadFromScratch()
                self.dataSource = toDos
            }, onError: { error in
                self.getViewDelegator().onError(error: error.localizedDescription)
            }, onCompleted: {}, onDisposed: {})
            .disposed(by: disposeBag)
    }
    
    func deleteToDoByIndex(_ index: Int, _ mode: ToDoMode) {
        toDoListManager
            .getRecordAtIndex(index: index).asObservable()
            .flatMap { toDoentity in self.toDoListManager.deleteToDo(toDo: toDoentity) }
            .asCompletable()
            .andThen(getToDosObservable(mode: mode))
            .subscribe(onNext: { toDos in
                self.getViewDelegator().toDoDidDeleted()
                self.reloadFromScratch()
                self.dataSource = toDos
            }, onError: { error in
                self.getViewDelegator().onError(error: error.localizedDescription)
            }, onCompleted: {}, onDisposed: {})
            .disposed(by: disposeBag)
    }
    
    deinit { disposeBag = nil }

}

extension ToDoPresenter {
    private func getActiveTodos() {
        getActiveTodosObservable()
            .subscribe(onNext: { toDos in self.dataSource = toDos },
                       onError: { error in
                        self.getViewDelegator().onError(error: error.localizedDescription)
            }, onCompleted: {}, onDisposed: {})
            .disposed(by: disposeBag)
    }
    private func getDoneTodos() {
        toDoListManager.getFinishedToDos()
            .map({ toDoEntityList -> [ToDoCellModel] in
                return self.transformToDoEntityListToToDoCellModelList(toDoEntites: toDoEntityList)
            })
            .subscribe(onNext: { toDos in self.dataSource = toDos },
                       onError: { error in
                        self.getViewDelegator().onError(error: error.localizedDescription)
            }, onCompleted: {}, onDisposed: {})
            .disposed(by: disposeBag)
    }
    private func markToDoAsDone(toDo: ToDoCellModel) {
        toDoListManager
            .updateToDo(toDo: transformToDoCellModelToToDoCellEntity(toDo: toDo))
            .andThen(getActiveTodosObservable())
            .subscribe(onNext: { toDos in
                self.getViewDelegator().toDoDidUpdated()
                self.reloadFromScratch()
                self.dataSource = toDos
            }, onError: { error in
                self.getViewDelegator().onError(error: error.localizedDescription)
            }, onCompleted: {}) {}
            .disposed(by: disposeBag)
    }
    private func markToDoAsActive(toDo: ToDoCellModel) {
        toDoListManager
            .updateToDo(toDo: transformToDoCellModelToToDoCellEntity(toDo: toDo))
            .andThen(getDoneTodosObservable())
            .subscribe(onNext: { toDos in
                self.getViewDelegator().toDoDidUpdated()
                self.reloadFromScratch()
                self.dataSource = toDos
            }, onError: { error in
                self.getViewDelegator().onError(error: error.localizedDescription)
            }, onCompleted: {}) {}
            .disposed(by: disposeBag)
    }
}

extension ToDoPresenter {
    private func transformToDoEntityListToToDoCellModelList(toDoEntites : [ToDoListEntity]) -> [ToDoCellModel] {
        var toDos: [ToDoCellModel] = [ToDoCellModel] ()
        toDoEntites.forEach({ toDoEntity in
            var toDo: ToDoCellModel = ToDoCellModel ()
            toDo.id = toDoEntity.id
            toDo.name = toDoEntity.name
            toDo.createdAt = DateTimeHelpers.getDateStringFromDate(date: toDoEntity.createdAt)
            toDo.isDone = toDoEntity.isDone
            toDos.append(toDo)
        })
        return toDos
    }
    private func transformToDoCellModelToToDoCellEntity(toDo: ToDoCellModel) -> ToDoListEntity {
        let toDoEntity: ToDoListEntity = ToDoListEntity()
        toDoEntity.id = toDo.id!
        toDoEntity.name = toDo.name!
        if let date = DateTimeHelpers.getDateFromDateString(dateString: toDo.createdAt!) {
            toDoEntity.createdAt = date
        }
        toDoEntity.isDone = toDo.isDone!
        return toDoEntity
    }
}

// Observables
extension ToDoPresenter {
    private func getActiveTodosObservable() -> Observable<[ToDoCellModel]> {
        return toDoListManager.getActiveToDos()
            .map({ toDoEntityList -> [ToDoCellModel] in
                return self.transformToDoEntityListToToDoCellModelList(toDoEntites: toDoEntityList)
            })
    }
    
    private func getDoneTodosObservable() -> Observable<[ToDoCellModel]> {
        return toDoListManager.getFinishedToDos()
            .map({ toDoEntityList -> [ToDoCellModel] in
                return self.transformToDoEntityListToToDoCellModelList(toDoEntites: toDoEntityList)
            })
    }
    private func createNewToDoCompletable(name: String) -> Completable {
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
    private func getToDosObservable(mode: ToDoMode) -> Observable<[ToDoCellModel]> {
        switch mode {
            case .Active: return getActiveTodosObservable()
            case .Done: return getDoneTodosObservable()
        }
    }
    
}
