////
////  BaseStubedAPIsConnector.swift
////  iOS_Bootstrap
////
////  Created by Ahmad Mahmoud on 1/19/19.
////  Copyright © 2019 CocoaPods. All rights reserved.
////
//
//import RxSwift
//
//open class BaseStubbedRestClient<T: GenericAPIs,
//                                 E: GenericErrorHandler>: GenericRestClient {
//    
//    public final var stubbedAPIsProvider : APIsProvider<T>!
//
//    public required override init() {
//        super.init()
//        if enableNetworkPlugins() {
//            stubbedAPIsProvider = APIsProvider<T>(stubClosure: MoyaProvider.immediatelyStub, plugins: configureNetworkPlugginsIfNeeded())
//        }
//        else {
//            stubbedAPIsProvider = APIsProvider<T>(stubClosure: MoyaProvider.immediatelyStub)
//        }
//        configureStubbedErrorHandle()
//    }
//
//    open func configureNetworkPlugginsIfNeeded() -> [PluginType] { return [] }
//    open func enableNetworkPlugins() -> Bool { return false }
//
//    open func configureStubbedErrorHandle() {
//        GenericErrorConfigurator.defaultErrorHandler(E.init())
//    }
//
//    open func stubbedRequest(api : T) -> Single <Response> {
//        return
//            stubbedAPIsProvider.rx
//                .request(api)
//                .filterSuccessfulStatusAndRedirectCodesAndProcessErrors()
//                .refreshAuthenticationTokenIfNeeded(tokenRefreshDelegate: self)
//                .processErrors()
//    }
//
//    public final func stubbedFlatRequest(api : T) -> Single <Response> {
//        return stubbedAPIsProvider.rx.request(api)
//    }
//
//    open func stubbedFlatRequestWithFilterError(api : T) -> Single <Response> {
//        return
//            stubbedAPIsProvider.rx
//                .request(api)
//                .filterSuccessfulStatusAndRedirectCodesAndProcessErrors()
//                .processErrors()
//    }
//
//    public final func stubbedRequestTokenRefresh(api : T) -> Single <Response> {
//        return stubbedFlatRequest(api: api)
//    }
//
//    public final func stubbedRequestWithProgress(api : T) -> Observable<ProgressResponse> {
//        return stubbedAPIsProvider.rx.requestWithProgress(api)
//    }
//
//    open func getJSONDecoder() -> JSONDecoder {
//        let decoder: JSONDecoder = JSONDecoder()
//        decoder.keyDecodingStrategy = getJSONDecoderDecodingStrategy()
//        return decoder
//    }
//
//    open func getJSONDecoderDecodingStrategy() -> JSONDecoder.KeyDecodingStrategy {
//        return JSONDecoder.KeyDecodingStrategy.convertFromSnakeCase
//    }
//
//    open func stubbedRequestSingle<M: Decodable>(api : T, model: M.Type) -> Single<M> {
//        return stubbedRequest(api: api).map(model.self, using: getJSONDecoder())
//    }
//    open func stubbedRequestObservable<M: Decodable>(api : T, model: M.Type) -> Observable<M> {
//        return stubbedRequestSingle(api: api, model: model).asObservable()
//    }
//    open func stubbedRequestMaybe<M: Decodable>(api : T, model: M.Type) -> Maybe<M> {
//        return stubbedRequestSingle(api: api, model: model).asMaybe()
//    }
//    open func stubbedRequestCompletable<M: Decodable>(api : T, model: M.Type) -> Completable {
//        return stubbedRequestSingle(api: api, model: model).asCompletable()
//    }
//    //
//    open func stubbedRequestStringSingle(api : T) -> Single<String> {
//        return stubbedRequest(api: api).mapString()
//    }
//    open func stubbedRequestStringObservable(api : T) -> Observable<String> {
//        return stubbedRequestStringSingle(api: api).asObservable()
//    }
//    open func stubbedRequestStringMaybe(api : T) -> Maybe<String> {
//        return stubbedRequestStringSingle(api: api).asMaybe()
//    }
//    open func stubbedRequestStringCompletable(api : T) -> Completable {
//        return stubbedRequestStringSingle(api: api).asCompletable()
//    }
//    //
//    open func stubbedRequestJsonSingle(api : T) -> Single<Any> {
//        return stubbedRequest(api: api).mapJSON()
//    }
//    open func stubbedRequestJsonObservable(api : T) -> Observable<Any> {
//        return stubbedRequestJsonSingle(api: api).asObservable()
//    }
//    open func stubbedRequestJsonMaybe(api : T) -> Maybe<Any> {
//        return stubbedRequestJsonSingle(api: api).asMaybe()
//    }
//    open func stubbedRequestJsonCompletable(api : T) -> Completable {
//        return stubbedRequestJsonSingle(api: api).asCompletable()
//    }
//    //
//    open func stubbedRrequestImageSingle(api : T) -> Single<UIImage> {
//        return stubbedRequest(api: api).mapImage()
//    }
//    open func stubbedRequestImageObservable(api : T) -> Observable<UIImage> {
//        return stubbedRrequestImageSingle(api: api).asObservable()
//    }
//    open func stubbedRequestImageMaybe(api : T) -> Maybe<UIImage> {
//        return stubbedRrequestImageSingle(api: api).asMaybe()
//    }
//    open func stubbedRequestImageCompletable(api : T) -> Completable {
//        return stubbedRrequestImageSingle(api: api).asCompletable()
//    }
//}
