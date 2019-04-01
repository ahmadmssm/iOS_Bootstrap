//
//  Decodable + Camel case.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 4/1/19.
//

import RxSwift

public extension PrimitiveSequence where TraitType == SingleTrait, ElementType == Response {
    func getJSONDecoder() -> JSONDecoder {
        let decoder: JSONDecoder = JSONDecoder()
        decoder.keyDecodingStrategy = getJSONDecoderDecodingStrategy()
        return decoder
    }
    
    func getJSONDecoderDecodingStrategy() -> JSONDecoder.KeyDecodingStrategy {
        return JSONDecoder.KeyDecodingStrategy.convertFromSnakeCase
    }
    
    
    func mapDecodable<D: Decodable>(_ type: D.Type) -> Single<D> {
        return self.map(type.self, using: self.getJSONDecoder())
    }
}

