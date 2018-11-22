//
//  AppDelegate.swift
//  iOS_Bootstrap
//
//  Created by ams.eng@hotmail.com on 06/08/2018.
//  Copyright (c) 2018 ams.eng@hotmail.com. All rights reserved.
//

import UIKit
import iOS_Bootstrap

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        //
        // Override point for customization after application launch.
        //
        DefaultConfigurations()
                .enableIQKeyboard()
                .iqKeyboardCanGoBack()
                .iqKeyboardCanGoNext()
                .setTokenRefreshListener(self)
                .setNavigationBartextApperance(textApperance: StaticResources.CustomStyles.navigationBarTextStyle)
                .setNavigationBarBackButtonColor(backButtonColor: UIColor.white)
                .build()
        Navigator.startInitialView()
        //
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
        //
        // Stops monitoring network reachability status changes
        InternetConnectionManager.getInstance.stopMonitoring()
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        //
        // Starts monitoring network reachability status changes
        InternetConnectionManager.getInstance.startMonitoring()
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

}

extension AppDelegate {
    static func getAppWindow() -> UIWindow {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.window!
    }
}

extension AppDelegate: AppDelegateService {
    // Refresh token callbacks
    func didFailedToRefreshToken() {}
    func tokenDidRefreshed(response: String) { Log.debug("Refresh token response : " + response) }
}

