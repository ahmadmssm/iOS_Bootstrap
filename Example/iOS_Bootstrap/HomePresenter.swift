//
//  HomePresenter.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 11/2/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

class HomePresenter: AppPresenter<HomeViewDelegate> {
    
    override func viewControllerDidLoad() {
        let collectionViewItems : [String] = ["Side menu", "Custom views", "Switch language", "Validatiors"]
        getViewDelegate().didGetCollectioViewItems(items: collectionViewItems)
    }
    
    func switchAppLanguage() {
        let langMngr: LanguageManager = resolver.resolve()
        langMngr.switchAppLanguage {
            navigoator.startInitialViewController()
        }
    }
}
