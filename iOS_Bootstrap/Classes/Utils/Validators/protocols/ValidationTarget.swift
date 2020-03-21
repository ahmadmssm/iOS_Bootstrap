//
//  ValidationTarget.swift
//  RxValidator
//
//  Created by 유금상 on 2018. 5. 30..
//

import Foundation
import RxSwift

public protocol ValidationTarget {
    
    associatedtype TargetType
    associatedtype ValidatorType
    
    typealias ValidatorInstanceCondition = (TargetType) -> Bool
    
    var value: TargetType? { get }
    var result: Observable<TargetType>? { get }
    
    func validate(_ validator: ValidatorType?) -> Self
    func validate(_ condition: ValidatorInstanceCondition, message: String?) -> Self
    func asObservable() -> Observable<TargetType>
    func check() -> RxValidatorResult
}

extension ValidationTarget {
    
    public func asObservable() -> Observable<TargetType> {
        if (self.result != nil) {
            return result!
        }
        else if (self.value != nil) {
            return Observable.just(value!)
        }
        else {
            return Observable.empty()
        }
    }
    
    public func asCompletable() -> Completable {
        return self.asObservable().asSingle().asCompletable()
    }
    
    public func check() -> RxValidatorResult {
        if let result = self.result {
            var validationError: RxValidatorResult?
            
            _ = result.asSingle().subscribe(onError: { (error) in
                validationError = RxValidatorResult.determine(error: error)
            })
            
            return validationError ?? .valid
        }
        
        return .valid
    }
}
