////
////  CodedBy.swift
////  iOS_Bootstrap_Example
////
////  Created by Ahmad Mahmoud on 3/14/20.
////  Copyright © 2020 CocoaPods. All rights reserved.
////
//
//@propertyWrapper
//public struct CodedBy<T: Transformer>: Codable, Nillable {
//   
//    public var wrappedValue: T.JsonObject
//
//    var isNil: Bool {
//           guard let wrapped = wrappedValue as? _Optional else { return false }
//           return wrapped.isNil
//    }
//    
//    public init(wrappedValue: T.JsonObject) {
//        self.wrappedValue = wrappedValue
//    }
//
//    public init(from decoder: Decoder) throws {
//        wrappedValue = try PropertyWrrappersUtils.decodeObject(transType: T.self, decoder: decoder)
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        try PropertyWrrappersUtils.encodeObject(object: wrappedValue, transType: T.self, encoder: encoder)
//    }
//}
