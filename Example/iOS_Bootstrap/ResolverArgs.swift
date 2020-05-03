//
//  ResolverArgs.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 5/3/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

class ResolverArgs {
    
    private var argsArray: [Any?] = []
    
    init(args: Any...) {
        self.argsArray = args.compactMap { ($0 as? [Any])?.first }
    }
    
    init<T0, T1, T2, T3, T4, T5>(arg0: T0? = nil,
                                 arg1: T1? = nil,
                                 arg2: T2? = nil,
                                 arg3: T3? = nil,
                                 arg4: T4? = nil,
                                 arg5: T5? = nil) {
        argsArray.append(arg0)
        argsArray.append(arg1)
        argsArray.append(arg2)
        argsArray.append(arg3)
        argsArray.append(arg4)
    }
    
    static func arg0<T>(_ args: Any?) -> T? {
        if let args = args as? ResolverArgs {
            return args.argsArray[0] as? T
        }
        else {
            return args as? T
        }
    }
    
    static func arg1<T>(_ args: Any?) -> T? {
        if let args = args as? ResolverArgs {
            return args.argsArray[1] as? T
        }
        else {
            return args as? T
        }
    }
    
    static func arg2<T>(_ args: Any?) -> T? {
        if let args = args as? ResolverArgs {
            return args.argsArray[2] as? T
        }
        else {
            return args as? T
        }
    }
    
    static func arg3<T>(_ args: Any?) -> T? {
        if let args = args as? ResolverArgs {
            return args.argsArray[3] as? T
        }
        else {
            return args as? T
        }
    }
    
    static func arg4<T>(_ args: Any?) -> T? {
        if let args = args as? ResolverArgs {
            return args.argsArray[5] as? T
        }
        else {
            return args as? T
        }
    }
    
    static func arg5<T>(_ args: Any?) -> T? {
        if let args = args as? ResolverArgs {
            return args.argsArray[4] as? T
        }
        else {
            return args as? T
        }
    }
    
    static func argument<T>(from args: Any, argumentNo: Int) -> T? {
        if let args = args as? ResolverArgs {
            if let arg = args.argsArray[exist: argumentNo] {
                return arg as? T
            }
            return args as? T
        }
        else if let arg = args as? T {
            return arg
        }
        else {
            return nil
        }
    }
}
