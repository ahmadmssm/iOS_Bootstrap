////
////  DecodableExtensions.swift
////  iOS_Bootstrap_Example
////
////  Created by Ahmad Mahmoud on 3/14/20.
////  Copyright © 2020 CocoaPods. All rights reserved.
////
//
//extension Decodable {
//
//    public static var keyed: Keyed<Self>.Type { return Keyed.self }
//
//    @available(*, deprecated, message: "Use DecodableType.keyed.fromJSON() instead. Replace all occurences of '(fromJSON: ' with '.keyed.fromJSON('.")
//    public init(fromJSON data: Data, decoder: KeyedJSONDecoder = KeyedConfig.default.defaultJSONDecoder()) throws {
//
//        self = try Self.keyed.fromJSON(data, decoder: decoder)
//    }
//
//    @available(*, deprecated, message: "Use DecodableType.keyed.fromJSON() instead. Replace all occurences of '(fromJSON: ' with '.keyed.fromJSON('.")
//    public init(fromJSON string: String, encoding: String.Encoding = .utf8, decoder: KeyedJSONDecoder = KeyedConfig.default.defaultJSONDecoder()) throws {
//
//        self = try Self.keyed.fromJSON(string, encoding: encoding, decoder: decoder)
//    }
//}
