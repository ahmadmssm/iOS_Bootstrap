//
//  GenericTypes.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 7/24/18.
//
// Ref : https://gist.github.com/mhuusko5/2191f4054f22682f0af1

open class GenericTypes {
    
    public class func ensureType<T>(type: T.Type = T.self, transform: (Any) -> T, _ any: Any) -> T {
        return ensureType(any: any, type: type, transform: transform)
    }
    
    public class func ensureType<T>(any: Any, type: T.Type = T.self, transform: (Any) -> T) -> T {
        if let any = any as? T { return any }
        return transform(any)
    }
}
