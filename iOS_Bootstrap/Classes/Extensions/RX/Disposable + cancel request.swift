//
//  Disposable + cancel request.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 11/10/18.
//

import RxSwift

public extension Disposable {
    public func cancelRequest() {
        if (self != nil) { self.dispose() }
    }
}
