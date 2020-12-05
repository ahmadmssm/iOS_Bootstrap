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
        self.argsArray = args.map { $0 as! [Any] }.first ?? [Any]()
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
        return resolveArgFor(index: 0, args)
    }
    
    static func arg1<T>(_ args: Any?) -> T? {
        return resolveArgFor(index: 1, args)
    }
    
    static func arg2<T>(_ args: Any?) -> T? {
        return resolveArgFor(index: 2, args)
    }
    
    static func arg3<T>(_ args: Any?) -> T? {
        return resolveArgFor(index: 3, args)
    }
    
    static func arg4<T>(_ args: Any?) -> T? {
        return resolveArgFor(index: 4, args)
    }
    
    static func arg5<T>(_ args: Any?) -> T? {
        return resolveArgFor(index: 5, args)
    }
    
    private static func resolveArgFor<T>(index: Int, _ args: Any?) -> T? {
        if let resolverArgs = args as? ResolverArgs {
            if let arg = resolverArgs.argsArray[exist: index] as? T {
                return arg
            }
            fatalError("Wrong Argument index")
        }
        else {
            return args as? T
        }
    }
    
    static func argument<T>(from args: Any, argumentNo: Int) -> T? {
        if let args: T = resolveArgFor(index: argumentNo, args) {
            return args
        }
        return args as? T
    }
}
