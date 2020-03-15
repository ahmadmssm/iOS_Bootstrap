////
////  EncodedBy.swift
////  iOS_Bootstrap_Example
////
////  Created by Ahmad Mahmoud on 3/14/20.
////  Copyright © 2020 CocoaPods. All rights reserved.
////
//
//@propertyWrapper
//public struct EncodedBy<T: EncodableTransformer>: Encodable, Nillable {
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
//    public func encode(to encoder: Encoder) throws {
//        try encodeObject(object: wrappedValue, transType: T.self, encoder: encoder)
//    }
//}
