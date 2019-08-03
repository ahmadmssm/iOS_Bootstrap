//
//  Extra operators.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 8/3/19.
//

import RxSwift

extension ObservableType where E == Bool {
    // Boolean not operator
    public func not() -> Observable<Bool> {
        return self.map(!)
    }
}

extension ObservableType {
    public func ignoreErrors() -> Observable<E> {
        return self.catchError { _ in .empty() }
    }
}

extension Observable where Element: Equatable {
    public func ignore(value: Element) -> Observable<Element> {
        return filter { (e) -> Bool in
            return value != e
        }
    }
}
