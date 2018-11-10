//
//  Response+HandyJSON.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 8/1/18.
//
//  Ref : https://github.com/hulinSun/Moya-HandyJSON/blob/master/Response%2BHandyJSON.swift
//

import HandyJSON
import RxSwift

public extension Response {
    // Data at path
    public func map<T: HandyJSON>(_ type: T.Type ,designatedPath: String) -> T?{
        guard let dataString = String(data: self.data, encoding: .utf8),
            let object = JSONDeserializer<T>.deserializeFrom(json: dataString, designatedPath: designatedPath)
            else {
                return nil
        }
        return object
    }
    // Data [Model]
    public func map<T: HandyJSON>(_ type: T.Type)  -> [T?]? {
        guard let dataString = String(data: self.data, encoding: .utf8),
            let object = JSONDeserializer<T>.deserializeModelArrayFrom(json: dataString)
            else {
                return nil
        }
        return object
    }
    // Data at path [Model]
    public func map<T: HandyJSON>(_ type: T.Type ,designatedPath: String )  -> [T?]? {
        guard let dataString = String(data: self.data, encoding: .utf8),
            let object = JSONDeserializer<T>.deserializeModelArrayFrom(json: dataString , designatedPath: designatedPath)
            else {
                return nil
        }
        return object
    }
}

public extension Response {
    func map<T: HandyJSON>(_ type: T.Type) throws -> T {
        let jsonString = String(data: data, encoding: .utf8)
        guard let json = JSONDeserializer<T>.deserializeFrom(json: jsonString) else {
            throw MoyaError.stringMapping(self)
        }
        return json
    }
    //
    public func map<T: HandyJSON>(_ type: T.Type) throws -> [T] {
        let dataString = String(data: self.data, encoding: .utf8)
        guard let json = JSONDeserializer<T>.deserializeModelArrayFrom(json: dataString) else {
            throw MoyaError.stringMapping(self)
        }
        return json as! [T]
    }
}

public extension ObservableType where E == Response {
    public func map<T: HandyJSON>(_ type: T.Type) -> Observable<T> {
        return flatMap({ Observable.just(try $0.map(T.self)) })
    }
    public func map<T: HandyJSON>(_ type: [T].Type) -> Observable<[T]> {
        return flatMap({ Observable.just([try $0.map(T.self)]) })
    }
}

public extension PrimitiveSequence where TraitType == SingleTrait, ElementType == Response {
    public func map<T: HandyJSON>(_ type: T.Type) -> Single<T> {
        return flatMap({ Single.just(try $0.map(T.self)) })
    }
    public func map<T: HandyJSON>(_ type: [T].Type) -> Single<[T]> {
        return flatMap({ Single.just([try $0.map(T.self)]) })
    }
}

