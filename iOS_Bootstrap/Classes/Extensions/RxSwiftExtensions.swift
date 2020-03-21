//
//  Disposable + cancel request.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 11/10/18.
//

import RxSwift

// Cancel HTTP request
extension Disposable {
    public func cancelRequest() {
        self.dispose() 
    }
}

// To String
extension ObservableType where Element == Bool {
    // Boolean not operator
    public func not() -> Observable<Bool> {
        return self.map(!)
    }
}

extension ObservableType {
    public func ignoreErrors() -> Observable<Element> {
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
