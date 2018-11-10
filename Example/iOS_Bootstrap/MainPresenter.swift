//
//  MainPresenter.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 11/2/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

class MainPresenter: BasePresenter<MainViewDelegator> {
    
    private var languageManager : LanguageManager!
    

    required init(viewDelegator: MainViewDelegator) {
        super.init(viewDelegator: viewDelegator)
        languageManager = LanguageManager()
    }
    
    func switchAppLanguage() {
        languageManager.switchAppLanguage {
            Navigator.startInitialView()
        }
    }
}
