//
//  StringShouldBeMatch.swift
//  RxValidator
//
//  Created by 유금상 on 2018. 6. 18..
//

open class StringShouldBeMatch: StringValidator {
    
    public let regex: NSRegularExpression?
    
    public init(_ regex: String) {
        self.regex = try? NSRegularExpression(pattern: regex, options: .caseInsensitive)
    }
    
    override public func validate(_ value: String?) throws {
        if (value == nil) {
            throw RxValidatorResult.nilObject
        }
        else if let _ = regex?.firstMatch(in: value!, options: NSRegularExpression.MatchingOptions.reportCompletion, range: NSRange(location: 0, length: value!.count)) {
            return
        }
        throw RxValidatorResult.stringIsNotMatch
    }
}

extension StringValidator {
    public static func shouldBeMatch(_ regex: String) -> StringValidator {
        return StringShouldBeMatch(regex)
    }
}
