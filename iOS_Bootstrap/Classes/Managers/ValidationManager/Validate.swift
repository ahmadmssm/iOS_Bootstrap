//
//  Validate.swift
//  RxValidator
//
//  Created by 유금상 on 2018. 6. 20..
//

import Foundation
import RxSwift

open class Validate {
    
    open class func to(_ value: String?) -> StringValidationTarget {
        return StringValidationTarget(value)
    }
    
    open class func to<T: Numeric>(_ value: T?) -> NumberValidationTarget<T> {
        return NumberValidationTarget(value)
    }
    
    open class func to(_ value: Date, granularity: Calendar.Component) -> DateValidationTarget {
        return DateValidationTarget(value, granularity: granularity)
    }
    
    open class func to(_ value: Date) -> DateValidationTarget {
        return DateValidationTarget(value)
    }
    
    open class func to<T>(_ value: T?) -> CustomObjectValidationTarget<T> {
        return CustomObjectValidationTarget(value)
    }
}
