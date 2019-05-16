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
        defaultConfigs = DefaultConfigurations()
            .enableIQKeyboard()
            .iqKeyboardCanGoBack()
            .iqKeyboardCanGoNext()
            .enableInternetConnectionMonitoring()
            .setTokenRefreshListener(self)
            .setNavigationBarTextApperance(textApperance: StaticResources.CustomStyles.navigationBarTextStyle)
            .setNavigationBarBackButtonColor(backButtonColor: UIColor.white)
            .setCoreDataModelName(modelName: Constants.coreDataModelName)
    }
    
    // Call in applicationDidBecomeActive
    func listenForNetworkConnectionChanges() {
        // Start monitoring network reachability status changes
        defaultConfigs?.startInternetConnectionMonitoring()
    }
    // Call in applicationWillEnterForeground
    func stopListeningForNetworkConnectionChanges() {
        // Stop monitoring network reachability status changes
        defaultConfigs?.stopInternetConnectionMonitoring()
    }
    
}
