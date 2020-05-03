//
//  ResolverExtensions.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 12/14/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Resolver

// MultiParams
extension Resolver {
    
    public func optional<Service>(_ type: Service.Type = Service.self,
                                         name: String? = nil,
                                         arg0: Any? = nil,
                                         arg1: Any? = nil,
                                         arg2: Any? = nil,
                                         arg3: Any? = nil,
                                         arg4: Any? = nil,
                                         arg5: Any? = nil) -> Service? {
        let args = ResolverArgs(arg0: arg0, arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4, arg5: arg5)
        return optional(type, name: name, args: args)
    }

     
    public final func optional<Service>(_ type: Service.Type = Service.self,
                                        name: String? = nil,
                                        arguments: Any...) -> Service? {
        let args = ResolverArgs(args: arguments)
        return optional(type, name: name, args: args)
    }
    
    public func resolve<Service>(_ type: Service.Type = Service.self,
                                  name: String? = nil,
                                  arg0: Any? = nil,
                                  arg1: Any? = nil,
                                  arg2: Any? = nil,
                                  arg3: Any? = nil,
                                  arg4: Any? = nil,
                                  arg5: Any? = nil) -> Service {
        let args = ResolverArgs(arg0: arg0, arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4, arg5: arg5)
        return resolve(type, name: name, args: args)
     }
    
    public func resolve<Service>(_ type: Service.Type = Service.self,
                                 name: String? = nil,
                                 arguments: Any...) -> Service {
        let args = ResolverArgs(args: arguments)
        return resolve(type, name: name, args: args)
    }
    
    func arg0<T>(from args: Any) -> T? {
        return ResolverArgs.arg0(args)
    }
    
    func arg1<T>(from args: Any) -> T? {
        return ResolverArgs.arg1(args)
    }
    
    func arg2<T>(from args: Any) -> T? {
        return ResolverArgs.arg2(args)
    }
    
    func arg3<T>(from args: Any) -> T? {
        return ResolverArgs.arg1(args)
    }
       
    func arg4<T>(from args: Any) -> T? {
        return ResolverArgs.arg4(args)
    }
       
    func arg5<T>(from args: Any) -> T? {
        return ResolverArgs.arg5(args)
    }
    
    func argument<T>(from args: Any, argumentNo: Int) -> T? {
        return ResolverArgs.argument(from: args, argumentNo: argumentNo)
    }
}

