//
//  AppDefaultConfigs.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 3/15/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

class AppDefaultConfigs: AppDelegateService {
    
    private var defaultConfigs: DefaultConfigurations?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        initEssentialAppConfigurations()
        return true
    }
    
    private func initEssentialAppConfigurations() {
        defaultConfigs = DefaultConfigurations()
            .enableIQKeyboard()
            .iqKeyboardCanGoBack()
            .iqKeyboardCanGoNext()
            .setTokenRefreshListener(self)
            .setNavigationBarTextApperance(textApperance: NSAttributedString.navigationBarTextStyle)
            .setNavigationBarBackButtonColor(backButtonColor: UIColor.white)
            .setCoreDataModelName(modelName: Constants.coreDataModelName)
    }
}
