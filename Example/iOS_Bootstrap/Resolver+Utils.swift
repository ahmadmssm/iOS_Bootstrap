//
//  Resolver+Utils.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 3/20/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import RxSwift
import Resolver
import Alamofire
import iOS_Bootstrap

extension Resolver {
    
    static func setResolverDefaultScope() {
        Resolver.defaultScope = Resolver.unique
    }
    
    static func getRxAPI<T: Decodable, API: AlamofireAPI>(api: API) -> Single<T> {
        let restClient = Resolver.resolve(RxAlamofireClientProtocol.self)
        return restClient.request(api: api)
    }
    
    static func getRxAPI<API: AlamofireAPI>(api: API) -> Single<Any> {
           let restClient = Resolver.resolve(RxAlamofireClientProtocol.self)
           return restClient.request(api: api)
    }
    
    static func getDataRxAPI<API: AlamofireAPI>(api: API) -> Single<Data> {
           let restClient = Resolver.resolve(RxAlamofireClientProtocol.self)
           return restClient.requesData(api: api)
    }
    
    static func getRxAPI<API: AlamofireAPI>(api: API) -> Completable {
        let restClient = Resolver.resolve(RxAlamofireClientProtocol.self)
        return restClient.request(api: api)
    }
}
