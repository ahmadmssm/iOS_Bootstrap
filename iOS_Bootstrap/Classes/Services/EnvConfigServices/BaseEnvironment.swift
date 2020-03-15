//
//  BaseEnvironment.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 3/15/20.
//

public protocol BaseEnvironment: SchemeService, CaseIterable {}

public extension BaseEnvironment
                where Self: Hashable & RawRepresentable,
                      Self.RawValue : StringProtocol {
    
    static func getEnvironmentVariables() -> Self {
        return getEnvironment(Self.self)
    }
}
