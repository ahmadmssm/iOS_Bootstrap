//
//  StringConvertable.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 9/25/18.
//

public protocol StringConvertable {
    func toString() -> String
}

public extension StringConvertable {
    func toString() -> String {
        return JSONSerializer.toJsonString(self, prettify: true)
    }
}
