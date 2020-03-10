//
//  main.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 3/11/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//
// Ref: https://qualitycoding.org/ios-app-delegate-testing/

import UIKit

let appDelegateClass: AnyClass = NSClassFromString("UnitTestingAppDelegate") ?? AppDelegate.self

UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, nil, NSStringFromClass(appDelegateClass))
