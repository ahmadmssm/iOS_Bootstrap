////
////  Requestable.swift
////  GitHubReposListingSample
////
////  Created by Ahmad Mahmoud on 6/24/19.
////  Copyright © 2019 Ahmad Mahmoud. All rights reserved.
////
//
//import iOS_Bootstrap
//import RxSwift
//
//public protocol Requestable: GenericAPIs {
//    associatedtype MappableType: Codable
//}
//
//extension Requestable {
//    
//    func getBuilder() -> AppRestClient<Self> {
//        return AppRestClient.getApiBuilder(api: Self.self)
//    }
//    
//    func getBuilderWithoutLoadingIndicator() -> AppRestClient<Self> {
//        return AppRestClient.getApiBuilderWithoutLoadingIndicator(api: Self.self)
//    }
//    
//    func buildRequest() -> Single<Response> {
//        return self.getBuilder().request(api: self)
//    }
//    
//    func buildRequestWithoutLoader() -> Single<Response> {
//        return self.getBuilderWithoutLoadingIndicator().request(api: self)
//    }
//    
//    func buildFlatRequest() -> Single<Response> {
//        return self.getBuilder().flatRequestWithFilterError(api: self)
//    }
//    
//    func buildFlatRequestWithoutLoader() -> Single<Response> {
//        return self
//            .getBuilderWithoutLoadingIndicator()
//            .flatRequestWithFilterError(api: self)
//    }
//    
//    func request(withLoader: Bool = true) -> Single<MappableType> {
//        if (withLoader) {
//            return self.mapWithDefaultMapper(response: self.buildRequest())
//        }
//        return self.mapWithDefaultMapper(response: self.self.buildRequestWithoutLoader())
//    }
//    
//    func requestWithNoAuthentication(withLoader: Bool = true) -> Single<MappableType> {
//        if (withLoader) {
//            return self.mapWithDefaultMapper(response: self.buildFlatRequest())
//        }
//        return self.mapWithDefaultMapper(response: self.self.buildFlatRequestWithoutLoader())
//    }
//    
//    func mapWithDefaultMapper(response: Single<Response>) -> PrimitiveSequence<SingleTrait, MappableType> {
//        if (MappableType.self == String.self) {
//            return response.mapString() as! PrimitiveSequence<SingleTrait, MappableType>
//        }
//        else {
//            return response.mapDecodable(MappableType.self)
//        }
//    }
//}
