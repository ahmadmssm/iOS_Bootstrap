//
//  RuntimeError.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 5/15/19.
//

open class RuntimeError: Error {
    
    private let message: String
    
    public init(_ message: String) { self.message = message }
    
    public var localizedDescription: String { return message }
}
