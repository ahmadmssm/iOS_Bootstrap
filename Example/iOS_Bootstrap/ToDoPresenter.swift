//
//  ToDoPresenter.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 12/21/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import iOS_Bootstrap
import RxSwift
import AFDateHelper

class ToDoPresenter: BaseLiveListingPresenter<ToDoViewDelegator, ToDoCellModel> {
    
    private var toDoListManager: ToDoListCachingManager!
    private var disposeBag: DisposeBag!
    
    required init(viewDelegator: ToDoViewDelegator) {
        super.init(viewDelegator: viewDelegator)
        toDoListManager = ToDoListCachingManager()
        disposeBag = DisposeBag()
    }
    
    override func viewControllerWillRefresh() { self.reloadFromScratch() }
    
    private func getActiveTodosObservable() -> Observable<[ToDoCellModel]> {
        return toDoListManager.getActiveToDos()
            .map({ toDoEntityList -> [ToDoCellModel] in
                return self.transformToDoEntityListToToDoCellModelList(toDoEntites: toDoEntityList)
            })
    }
    
    func getActiveTodos() {
        getActiveTodosObservable()
            .subscribe(onNext: { toDos in self.dataSource = toDos },
                       onError: { error in
                        self.getViewDelegator().onError(error: error.localizedDescription)
            }, onCompleted: {}, onDisposed: {})
            .disposed(by: disposeBag)
    }
    
    func getFinishedTodos() {
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
    
    // Create new toDo and get all active todos
    func createNewToDo(name: String) {
        createNewToDoCompletable(name: name)
            .andThen(getActiveTodosObservable()).subscribe(onNext: { toDos in
                self.getViewDelegator().newToDoDidCreated()
                self.reloadFromScratch()
                self.dataSource = toDos
            }, onError: { error in
            self.getViewDelegator().onError(error: error.localizedDescription)
        }, onCompleted: {}) {}
            .disposed(by: disposeBag)
    }
    
    private func createNewToDoCompletable(name: String) -> Completable {
        return toDoListManager.getLatestToDoId()
            .map { id -> ToDoListEntity in
                let toDoEntity: ToDoListEntity = ToDoListEntity()
                toDoEntity.name = name
                toDoEntity.createdAt = Helpers.getCurrentDate()
                toDoEntity.id = id
                return toDoEntity
            }
            .asObservable()
            .flatMap { newToDo in self.toDoListManager.addNewToDo(toDo: newToDo) }
            .asCompletable()
    }
    
    private func transformToDoEntityListToToDoCellModelList(toDoEntites : [ToDoListEntity]) -> [ToDoCellModel] {
        var toDos: [ToDoCellModel] = [ToDoCellModel] ()
        toDoEntites.forEach({ toDoEntity in
            var toDo: ToDoCellModel = ToDoCellModel ()
            toDo.name = toDoEntity.name
            toDo.createdAt = toDoEntity.createdAt.toString(style: .medium)
            toDo.isDone = toDoEntity.isDone
            toDos.append(toDo)
        })
        return toDos
    }
    
    func getToDoWithIndex(index: Int) {
        getViewDelegator().didGetSavedToDo(toDo: self.dataSource[index])
    }
    
    
    deinit { disposeBag = nil }

}

