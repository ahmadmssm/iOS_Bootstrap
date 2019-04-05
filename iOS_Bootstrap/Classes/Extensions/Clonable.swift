//
//  Clonable.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 3/5/19.
//

public protocol Clonable { init(object: Self) }

public extension Clonable { func clone() -> Self { return Self.init(object: self) } }
