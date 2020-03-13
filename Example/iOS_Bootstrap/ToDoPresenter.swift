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
       
    private func reloadFromScratch() {
        toDoRepo
            .getToDos(mode: mode)
            .subscribe(onSuccess: { [weak self] toDos in
                self?.getViewDelegate().didGetAllToDos(toDos: toDos)
            }, onError: { [weak self] error in
                    self?.postError(errorMessage: error.localizedDescription)
            })
            .disposed(by: disposeBag)
    }
    
    func changeToDoStatus(toDo: ToDoCellModel) {
        toDoRepo
            .changeToDoStatus(toDo: toDo)
            .subscribe(onCompleted: { [weak self] in
                self?.getViewDelegate().didUpdateToDo()
                self?.reloadFromScratch()
             }, onError: { [weak self] error in
                self?.postError(errorMessage: error.localizedDescription)
            })
            .disposed(by: disposeBag)
    }
}
