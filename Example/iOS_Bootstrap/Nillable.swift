//
//  Nillable.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 3/14/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

protocol Nillable {
    associatedtype wrappedValue
    var isNil: Bool { get }
}

