//
//  ToDoPresenter.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 12/21/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import iOS_Bootstrap
import RxSwift
import Resolver

class ToDoPresenter: AppPresenter<ToDoViewDelegate> {
    
    @LazyInjected private var toDoRepo: ToDoRepo
    private var mode: ToDoMode!
    
    required convenience init (viewDelegate: ToDoViewDelegate, mode: ToDoMode) {
        self.init(viewDelegate: viewDelegate)
        self.mode = mode
    }
    
    override func viewControllerWillRefresh() {
           self.reloadFromScratch()
    }
       
     func reloadFromScratch() {
        toDoRepo
            .getToDos(mode: mode)
            .subscribe(onSuccess: { [weak self] toDos in
                self?.getViewDelegate().didGetAllToDos(toDos: toDos)
            }, onError: { [weak self] error in
                    self?.postError(errorMessage: error.localizedDescription)
            })
            .disposed(by: disposeBag)
    }
    
    func createNewToDo(name: String) {
        toDoRepo
            .createNewToDo(name: name)
            .subscribe(onCompleted: { [weak self] in
                self?.getViewDelegate().didCreateNewToDo()
                self?.reloadFromScratch()
        }) { [weak self] error in
            self?.postError(errorMessage: error.localizedDescription)
        }
        .disposed(by: disposeBag)
    }
    
    func update(toDo: ToDoCellModel) {
        toDoRepo
            .updateToDo(toDo: toDo)
            .subscribe(onCompleted: { [weak self] in
                self?.getViewDelegate().didUpdateToDo()
                self?.reloadFromScratch()
             }, onError: { [weak self] error in
                self?.postError(errorMessage: error.localizedDescription)
            })
            .disposed(by: disposeBag)
    }
    
    func delete(toDo: ToDoCellModel, mode: ToDoMode) {
        toDoRepo
            .deleteToDo(toDo: toDo, forMode: mode)
            .subscribe(onCompleted: { [weak self] in
                self?.getViewDelegate().didDeleteToDo()
                self?.reloadFromScratch()
             }, onError: { [weak self] error in
                self?.postError(errorMessage: error.localizedDescription)
            })
            .disposed(by: disposeBag)
    }
}
