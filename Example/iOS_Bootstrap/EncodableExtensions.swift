////
////  EncodableExtensions.swift
////  iOS_Bootstrap_Example
////
////  Created by Ahmad Mahmoud on 3/14/20.
////  Copyright © 2020 CocoaPods. All rights reserved.
////
//
//import Foundation
//
//extension Encodable {
//
//    public var keyed: Keyed<Self> { return Keyed(self) }
//
//    @available(*, deprecated, message: "Use keyed.jsonData() instead")
//    public func jsonData(encoder: KeyedJSONEncoder = KeyedConfig.default.defaultJSONEncoder()) throws -> Data {
//
//        return try keyed.jsonData(encoder: encoder)
//    }
//
//    @available(*, deprecated, message: "Use keyed.jsonString() instead")
//    public func jsonString(encoding: String.Encoding = .utf8, encoder: KeyedJSONEncoder = KeyedConfig.default.defaultJSONEncoder()) throws -> String {
//
//        return try keyed.jsonString(encoding: encoding, encoder: encoder)
//    }
//}
