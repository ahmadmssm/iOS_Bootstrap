//
//  Box.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 5/14/19.
//

import ObjectiveC

public final class Box<T> {
    let value: T
    init(_ x: T) {
        value = x
    }
}

private func box<T>(x: T) -> Box<T>  {
    return Box(x)
}

public func setAssociatedObject<T>(object: AnyObject,
                            value: T,
                            associativeKey: UnsafeRawPointer,
                            policy: objc_AssociationPolicy) {
    if let v: AnyObject = value as? AnyObject {
        objc_setAssociatedObject(object, associativeKey, v,  policy)
    }
    else {
        objc_setAssociatedObject(object, associativeKey, box(x: value),  policy)
    }
}

public func getAssociatedObject<T>(object: AnyObject,
                            associativeKey: UnsafeRawPointer) -> T? {
    if let v = objc_getAssociatedObject(object, associativeKey) as? T {
        return v
    }
    else if let v = objc_getAssociatedObject(object, associativeKey) as? Box<T> {
        return v.value
    }
    else {
        return nil
    }
}
