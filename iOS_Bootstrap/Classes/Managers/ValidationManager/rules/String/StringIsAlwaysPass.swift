//
//  StringIsAlwaysPass.swift
//  Nimble
//
//  Created by 유금상 on 2018. 6. 20..
//

open class StringIsAlwaysPass: StringValidator {
    
    override public func validate(_ value: String?) throws {
        //do nothing..
    }
}

extension StringValidator {
    public static var isAlwaysPass: StringValidator {
        return StringIsAlwaysPass()
    }
}
