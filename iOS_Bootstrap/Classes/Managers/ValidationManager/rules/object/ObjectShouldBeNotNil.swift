//
//  ObjectShouldBeNotNil.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 2/9/19.
//

public class ObjectShouldBeNotNil<T: Any>: ObjectValidator<T> {
   
    override public init() {}

    public override func validate(_ value: T?) throws {
        if (value == nil) {
            throw RxValidatorResult.nilObject
        }
    }
    
}

public extension ObjectValidator {
    public static func shouldBeNotNil(_ value: T) -> ObjectValidator<T> {
        return ObjectShouldBeNotNil()
    }
}
