//
//  BuildVariantService.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 8/2/18.
//
//  Ref :
//  https://stackoverflow.com/questions/24007461/how-to-enumerate-an-enum-with-string-type
//  https://cocoacasts.com/switching-environments-with-configurations
//

public protocol BuildVariantService {}

public extension BuildVariantService {
    //
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
    //
    //
    public static func getEnvironment<T: Hashable & RawRepresentable>(_: T.Type) -> T where T.RawValue : StringProtocol
            {
        if let configuration = Bundle.main.object(forInfoDictionaryKey: "Configuration") as? String {
            for environment in Enum(T.self) {
//                if configuration.isEqual(environment.hashValue) {
                if (configuration.range(of: (environment.rawValue)) != nil) {
                    return environment
                }
            }
        }
        return T.self as! T
    }
}
