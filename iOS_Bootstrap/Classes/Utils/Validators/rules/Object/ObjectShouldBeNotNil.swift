//
//  ObjectShouldBeNotNil.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 2/9/19.
//

open class ObjectShouldBeNotNil<T>: ObjectValidator<T> {
   
    override public init() {}

    public override func validate(_ value: T?) throws {
        if (value == nil) {
            throw RxValidatorResult.nilObject
        }
    }
}

public extension ObjectShouldBeNotNil {
    static func shouldBeNotNil(_ value: T?) -> ObjectValidator<T> {
        return ObjectValidator()
    }
}
