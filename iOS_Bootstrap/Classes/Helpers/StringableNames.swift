//
//  StringableNames.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 7/20/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation

public protocol StringableNames {
    var getStringName: String { get }
    
}

extension StringableNames {
    public var getStringName: String {
        get {
            return String(describing: self)
        }
    }
}
