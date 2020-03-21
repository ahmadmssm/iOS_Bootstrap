//
//  SchemeTypeService.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 8/2/18.
//
//  Ref :
//  https://stackoverflow.com/questions/24007461/how-to-enumerate-an-enum-with-string-type
//  https://cocoacasts.com/switching-environments-with-configurations
//

public protocol SchemeTypeService {}

public extension SchemeTypeService {
    
    // Enum looping helper function
    private static func Enum<T: Hashable>(_: T.Type) -> AnyIterator<T> {
        var i = 0
        return AnyIterator {
            let next = withUnsafePointer(to: &i) {
                $0.withMemoryRebound(to: T.self, capacity: 1) { $0.pointee }
            }
            if next.hashValue != i { return nil }
            i += 1
            return next
        }
    }
    
    internal static func getEnvironment<T: CaseIterable & Hashable & RawRepresentable>(_: T.Type) -> T where T.RawValue : StringProtocol {
        if let configuration = Bundle.main.object(forInfoDictionaryKey: "Configuration") as? String {
            //
            #if swift(>=4)
            print("Running Swift 4.0 or later")
            for environment in T.allCases {
            if (configuration.range(of: (environment.rawValue)) != nil) {
            return environment
            }
            }
            #else
            print("Running old Swift")
            for environment in Enum(T.self) {
                if (configuration.range(of: (environment.rawValue)) != nil) {
                    return environment
                }
            }
            #endif
            //
        }
        return T.self as! T
    }
}
