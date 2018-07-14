//
//  DependancyInjection.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 7/14/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

public protocol DependancyInjection {
    //
    static var context : UIViewController? { get set }
    //
    static func setContext(context : UIViewController)
    static func getContext() -> UIViewController
}
