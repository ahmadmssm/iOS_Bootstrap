////
////  KeyedExtensions.swift
////  iOS_Bootstrap_Example
////
////  Created by Ahmad Mahmoud on 3/14/20.
////  Copyright © 2020 CocoaPods. All rights reserved.
////
//
//extension Keyed where Base: Encodable {
//
//    public func jsonData(encoder: GsonEncoder = GsonConfigs.default.defaultJSONEncoder()) throws -> Data {
//        return try encoder.encode(value)
//    }
//
//    public func jsonString(encoding: String.Encoding = .utf8, encoder: GsonEncoder = GsonConfigs.default.defaultJSONEncoder()) throws -> String {
//        let data = try encoder.encode(value)
//        return try String.from(data: data, encoding: encoding)
//    }
//}
//
//extension Keyed: Encodable where Base: Encodable {
//    public func encode(to encoder: Encoder) throws {
//        if let keyedEncoder = encoder as? KeyedEncoder {
//            try value.encode(to: keyedEncoder)
//        } else {
//            try value.encode(to: KeyedEncoder(encoder: encoder, codingPath: encoder.codingPath, cache: nil))
//        }
//    }
//}
