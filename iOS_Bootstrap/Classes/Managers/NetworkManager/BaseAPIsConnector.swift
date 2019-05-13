//
//  BaseAPIsConnector.swift
//  Alamofire
//
//  Created by Ahmad Mahmoud on 11/5/18.
//

import RxSwift

open class BaseAPIsConnector<T : GenericAPIs> : GenericConnector {

    public final var apisProvider : APIsProvider<T>!

    public override init() {
        super.init()
        if enableNetworkPlugins() {
            apisProvider = APIsProvider<T>(plugins: configureNetworkPlugginsIfNeeded())
        }
        else {
            apisProvider = APIsProvider<T>()
        }
        configureErrorHandle()
    }

    open func configureNetworkPlugginsIfNeeded() -> [PluginType] { return [] }
    open func enableNetworkPlugins() -> Bool { return false }
    open func configureErrorHandle() { fatalError("Must Override") }
    
    open func request(api : T) -> Single <Response> {
        return
            apisProvider.rx
                .request(api)
                .filterSuccessfulStatusAndRedirectCodesAndProcessErrors()
                .refreshAuthenticationTokenIfNeeded(tokenRefreshDelegate: self)
                .processErrors()
    }
    
    open func flatRequest(api : T) -> Single <Response> {
        return apisProvider.rx.request(api)
    }
  
    open func flatRequestWithFilterError(api : T) -> Single <Response> {
        return
            apisProvider.rx
                .request(api)
                .filterSuccessfulStatusAndRedirectCodesAndProcessErrors()
                .processErrors()
    }
    
    open func requestTokenRefresh(api : T) -> Single <Response> {
        return flatRequestWithFilterError(api: api)
    }
    
    open func requestWithProgress(api : T) -> Observable<ProgressResponse> {
        return apisProvider.rx.requestWithProgress(api)
    }
    
    open func getJSONDecoder() -> JSONDecoder {
        let decoder: JSONDecoder = JSONDecoder()
        decoder.keyDecodingStrategy = getJSONDecoderDecodingStrategy()
        return decoder
    }
    
    open func getJSONDecoderDecodingStrategy() -> JSONDecoder.KeyDecodingStrategy {
        return JSONDecoder.KeyDecodingStrategy.convertFromSnakeCase
    }
    
    
    open func requestSingle<M: Decodable>(api : T, model: M.Type) -> Single<M> {
        return request(api: api).map(model.self, using: getJSONDecoder())
    }
    open func requestObservable<M: Decodable>(api : T, model: M.Type) -> Observable<M> {
        return requestSingle(api: api, model: model).asObservable()
    }
    open func requestMaybe<M: Decodable>(api : T, model: M.Type) -> Maybe<M> {
        return requestSingle(api: api, model: model).asMaybe()
    }
    open func requestCompletable<M: Decodable>(api : T, model: M.Type) -> Completable {
        return requestSingle(api: api, model: model).asCompletable()
    }
    //
    open func requestStringSingle(api : T) -> Single<String> {
        return request(api: api).mapString()
    }
    open func requestStringObservable(api : T) -> Observable<String> {
        return requestStringSingle(api: api).asObservable()
    }
    open func requestStringMaybe(api : T) -> Maybe<String> {
        return requestStringSingle(api: api).asMaybe()
    }
    open func requestStringCompletable(api : T) -> Completable {
        return requestStringSingle(api: api).asCompletable()
    }
    //
    open func requestJsonSingle(api : T) -> Single<Any> {
        return request(api: api).mapJSON()
    }
    open func requestJsonObservable(api : T) -> Observable<Any> {
        return requestJsonSingle(api: api).asObservable()
    }
    open func requestJsonMaybe(api : T) -> Maybe<Any> {
        return requestJsonSingle(api: api).asMaybe()
    }
    open func requestJsonCompletable(api : T) -> Completable {
        return requestJsonSingle(api: api).asCompletable()
    }
    //
    open func requestImageSingle(api : T) -> Single<UIImage?> {
        return request(api: api).mapImage()
    }
    open func requestImageObservable(api : T) -> Observable<UIImage?> {
        return requestImageSingle(api: api).asObservable()
    }
    open func requestImageMaybe(api : T) -> Maybe<UIImage?> {
        return requestImageSingle(api: api).asMaybe()
    }
    open func requestImageCompletable(api : T) -> Completable {
        return requestImageSingle(api: api).asCompletable()
    }
    
}
