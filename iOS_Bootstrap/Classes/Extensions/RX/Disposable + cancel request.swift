//
//  Disposable + cancel request.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 11/10/18.
//

import RxSwift

public extension Disposable {
    func cancelRequest() {
        self.dispose() 
    }
}
