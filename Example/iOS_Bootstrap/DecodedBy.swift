////
////  DecodedBy.swift
////  iOS_Bootstrap_Example
////
////  Created by Ahmad Mahmoud on 3/14/20.
////  Copyright © 2020 CocoaPods. All rights reserved.
////
//
//@propertyWrapper
//public struct DecodedBy<T: DecodableTransformer>: Decodable, Nillable {
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
//        wrappedValue = try decodeObject(transType: T.self, decoder: decoder)
//    }
//}
