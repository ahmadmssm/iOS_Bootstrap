//
//  ScopeFunctions.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 25/01/2021.
//
// Ref:- https://akiwang.com/blog/20201030_swift_scope_functions/

import Foundation

public protocol ScopeFunctions {}

public extension ScopeFunctions {
    @discardableResult
    func also(block: (Self) -> ()) -> Self {
        block(self)
        return self
    }
    
    @discardableResult
    func apply(block: (Self) -> ()) -> Self {
        block(self)
        return self
    }
    
    @discardableResult
    func `let`<R>(block: (Self) -> R) -> R? {
        return block(self)
    }
    
    @discardableResult
    func run<R>(block: (Self) -> R) -> R? {
        return block(self)
    }
}

extension Optional where Wrapped: ScopeFunctions { }

extension NSObject: ScopeFunctions {}
extension Array: ScopeFunctions {}
extension String: ScopeFunctions {}
extension String.SubSequence: ScopeFunctions {}
extension Int: ScopeFunctions {}
extension Float: ScopeFunctions {}
extension Double: ScopeFunctions {}
extension Bool: ScopeFunctions {}
