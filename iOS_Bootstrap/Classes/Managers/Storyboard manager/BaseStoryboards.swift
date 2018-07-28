//
//  BaseStoryboards.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 7/20/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation

public protocol BaseStoryboards {
    var getStringName: String { get }
    
}

extension BaseStoryboards {
    public var getStringName: String {
        get {
            return String(describing: self)
        }
    }
}
