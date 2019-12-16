//
//  MainPresenter.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 11/2/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

class MainPresenter: BasePresenter<MainViewDelegator> {
    
    private var langMngr : LanguageManager!

    required init(viewDelegator: MainViewDelegator) {
        super.init(viewDelegator: viewDelegator)
        langMngr = LanguageManager()
    }
    
    func setDataSource() {
        let collectionViewItems : [String] = ["Side menu", "Custom views", "Switch language", "Validatiors"]
        getViewDelegate().didGetCollectioViewItems(items: collectionViewItems)
    }
    
    func switchAppLanguage() {
        langMngr.switchAppLanguage {
            Navigator.startInitialView()
        }
    }
}
