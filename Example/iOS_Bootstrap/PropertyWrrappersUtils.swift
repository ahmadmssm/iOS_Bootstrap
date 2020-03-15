////
////  PropertyWrrappersUtils.swift
////  iOS_Bootstrap_Example
////
////  Created by Ahmad Mahmoud on 3/14/20.
////  Copyright © 2020 CocoaPods. All rights reserved.
////
//
//struct PropertyWrrappersUtils {
//  
//    static func encodeObject<T>(object: T.JsonObject, transType: T.Type, encoder: Encoder)
//        throws where T: EncodableTransformer {
//            let encodable = try T.transform(object: object)
//            var container = encoder.singleValueContainer()
//            try container.encode(encodable)
//    }
//
//    static func decodeObject<T>(transType: T.Type, decoder: Decoder)
//        throws -> T.JsonObject where T: DecodableTransformer{
//
//        let source: T.Source
//
//        if let type = T.Object.self as? _Optional.Type, !(T.Source.self is _Optional.Type) {
//            guard let s = try Optional<T.Source>(from: decoder) else {
//                return type.empty as! T.Object
//            }
//            source = s
//        } else {
//            source = try T.Source(from: decoder)
//        }
//
//        guard let value = try T.transform(from: source) as? T.Object else {
//            throw KeyedCodableError.transformFailed
//        }
//        return value
//    }
//}
