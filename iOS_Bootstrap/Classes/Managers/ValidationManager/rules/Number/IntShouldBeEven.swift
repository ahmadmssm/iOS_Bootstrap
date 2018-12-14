//
//  IntShouldBeEven.swift
//  RxValidator
//
//  Created by 유금상 on 2018. 6. 20..
//

public final class IntShouldBeEven: NumberValidator<Int> {
    override public func validate(_ value: Int) throws {
        if (value % 2) != 0 {
            throw RxValidatorResult.notEvenNumber
        }
    }
}

extension NumberValidator where T == Int {
    public static var shouldBeEven: NumberValidator<Int> {
        return IntShouldBeEven()
    }
}
