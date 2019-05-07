//
//  StringShouldEqualTo.swift
//  RxValidator iOS
//
//  Created by Kawoou on 06/10/2018.
//

import Foundation

open class StringShouldEqualTo: StringValidator {
    
    public let string: String

    public init(_ string: String) {
        self.string = string
    }
    
    override public func validate(_ value: String?) throws {
        if (value == nil) {
            throw RxValidatorResult.nilObject
        }
        else if value! != string {
            throw RxValidatorResult.notEqualString
        }
    }
}

extension StringValidator {
    public static func shouldEqualTo(_ string: String) -> StringValidator {
        return StringShouldEqualTo(string)
    }
}
