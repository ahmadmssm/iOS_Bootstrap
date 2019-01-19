//
//  EssentialAppConfigurations.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 1/19/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

extension AppDelegate {
    // Call in didFinishLaunchingWithOptions
    func initEssentialAppConfigurations() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        DefaultConfigurations()
            .enableIQKeyboard()
            .iqKeyboardCanGoBack()
            .iqKeyboardCanGoNext()
            .setTokenRefreshListener(self)
            .setNavigationBarTextApperance(textApperance: StaticResources.CustomStyles.navigationBarTextStyle)
            .setNavigationBarBackButtonColor(backButtonColor: UIColor.white)
            .setCoreDataModelName(modelName: Constants.coreDataModelName)
        //
    }
    
    func listenForNetworkConnectionChanges() {
        // Start monitoring network reachability status changes
        InternetConnectionManager.getInstance.startMonitoring()
    }
    
    func stopListeningForNetworkConnectionChanges() {
        // Stop monitoring network reachability status changes
        InternetConnectionManager.getInstance.stopMonitoring()
    }
    
}
