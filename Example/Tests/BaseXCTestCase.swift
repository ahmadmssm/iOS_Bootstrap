//
//  BaseXCTestCase.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 3/11/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//
// Ref: https://stackoverflow.com/questions/27930137/ios-swift-separate-appdelegate-for-xctest

import XCTest

class BaseXCTestCase: XCTestCase {
    
    override func setUp() {
        super.setUp()
        UIApplication.shared.delegate = UnitTestingAppDelegate()
    }
}
