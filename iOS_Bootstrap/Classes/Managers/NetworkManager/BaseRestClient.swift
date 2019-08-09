//
//  BaseRestClient.swift
//  Alamofire
//
//  Created by Ahmad Mahmoud on 11/5/18.
//

import RxSwift

public protocol BaseRestable where Self: GenericRestClient {
    
    associatedtype API: GenericAPIs
    
    init(enableLoadingActivity: Bool)
    func configureNetworkPlugginsIfNeeded() -> [PluginType]
    func enableNetworkPlugins() -> Bool
    func configureErrorHandle()
    func request(api: API) -> Single<Response>
    func flatRequest(api : API) -> Single<Response>
    func flatRequestWithFilterError(api : API) -> Single<Response>
    func requestTokenRefresh(api : API) -> Single<Response>
    func requestWithProgress(api : API) -> Observable<ProgressResponse>
    func getJSONDecoder() -> JSONDecoder
    func getJSONDecoderDecodingStrategy() -> JSONDecoder.KeyDecodingStrategy
    func requestSingle<M: Decodable>(api : API, model: M.Type) -> Single<M>
    func requestObservable<M: Decodable>(api : API, model: M.Type) -> Observable<M>
    func requestMaybe<M: Decodable>(api : API, model: M.Type) -> Maybe<M>
    func requestCompletable<M: Decodable>(api : API, model: M.Type) -> Completable
    func requestStringSingle(api : API) -> Single<String>
    func requestStringObservable(api : API) -> Observable<String>
    func requestStringMaybe(api : API) -> Maybe<String>
    func requestStringCompletable(api : API) -> Completable
    func requestJsonSingle(api : API) -> Single<Any>
    func requestJsonObservable(api : API) -> Observable<Any>
    func requestJsonMaybe(api : API) -> Maybe<Any>
    func requestJsonCompletable(api : API) -> Completable
    func requestImageSingle(api : API) -> Single<UIImage>
    func requestImageObservable(api : API) -> Observable<UIImage>
    func requestImageMaybe(api : API) -> Maybe<UIImage>
    func requestImageCompletable(api : API) -> Completable
    //
    static func getApiBuilder(api: API.Type) -> Self
    static func getApiBuilderWithoutLoadingIndicator(api: API.Type) -> Self
}

open class BaseRestClient<API: GenericAPIs, E: GenericErrorHandler>:
                               GenericRestClient,
                               BaseRestable {

    public final var apisProvider : APIsProvider<API>!
    public private(set) var isLoadingActivityEnabled:Bool = true

    
    public required init(enableLoadingActivity: Bool = true) {
        super.init()
        self.isLoadingActivityEnabled = enableLoadingActivity
        if enableNetworkPlugins() {
            if (TestingHelpers.isRunningTests()) {
                apisProvider = APIsProvider<API>(stubClosure: MoyaProvider.immediatelyStub, plugins: configureNetworkPlugginsIfNeeded())
            }
            else {
                apisProvider = APIsProvider<API>(plugins: configureNetworkPlugginsIfNeeded())
            }
        }
        else {
            if (TestingHelpers.isRunningTests()) {
                apisProvider = APIsProvider<API>(stubClosure: MoyaProvider.immediatelyStub)
            }
            else {
                apisProvider = APIsProvider<API>()
            }
        }
        configureErrorHandle()
    }

    open func configureNetworkPlugginsIfNeeded() -> [PluginType] { return [] }
    open func enableNetworkPlugins() -> Bool { return false }
    
    open func configureErrorHandle() {
        GenericErrorConfigurator.defaultErrorHandler(E.init())
    }
    
    open func request(api : API) -> Single<Response> {
        return
            apisProvider.rx
                .request(api)
                .filterSuccessfulStatusAndRedirectCodesAndProcessErrors()
                .refreshAuthenticationTokenIfNeeded(tokenRefreshDelegate: self)
                .processErrors()
    }
    
    open func flatRequest(api : API) -> Single<Response> {
        return apisProvider.rx.request(api)
    }
  
    open func flatRequestWithFilterError(api : API) -> Single<Response> {
        return
            apisProvider.rx
                .request(api)
                .filterSuccessfulStatusAndRedirectCodesAndProcessErrors()
                .processErrors()
    }
    
    open func requestTokenRefresh(api : API) -> Single<Response> {
        return flatRequestWithFilterError(api: api)
    }
    
    open func requestWithProgress(api : API) -> Observable<ProgressResponse> {
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
    
    
    open func requestSingle<M: Decodable>(api : API, model: M.Type) -> Single<M> {
        return request(api: api).map(model.self, using: getJSONDecoder())
    }
    open func requestObservable<M: Decodable>(api : API, model: M.Type) -> Observable<M> {
        return requestSingle(api: api, model: model).asObservable()
    }
    open func requestMaybe<M: Decodable>(api : API, model: M.Type) -> Maybe<M> {
        return requestSingle(api: api, model: model).asMaybe()
    }
    open func requestCompletable<M: Decodable>(api : API, model: M.Type) -> Completable {
        return requestSingle(api: api, model: model).asCompletable()
    }
    //
    open func requestStringSingle(api : API) -> Single<String> {
        return request(api: api).mapString()
    }
    open func requestStringObservable(api : API) -> Observable<String> {
        return requestStringSingle(api: api).asObservable()
    }
    open func requestStringMaybe(api : API) -> Maybe<String> {
        return requestStringSingle(api: api).asMaybe()
    }
    open func requestStringCompletable(api : API) -> Completable {
        return requestStringSingle(api: api).asCompletable()
    }
    //
    open func requestJsonSingle(api : API) -> Single<Any> {
        return request(api: api).mapJSON()
    }
    open func requestJsonObservable(api : API) -> Observable<Any> {
        return requestJsonSingle(api: api).asObservable()
    }
    open func requestJsonMaybe(api : API) -> Maybe<Any> {
        return requestJsonSingle(api: api).asMaybe()
    }
    open func requestJsonCompletable(api : API) -> Completable {
        return requestJsonSingle(api: api).asCompletable()
    }
    //
    open func requestImageSingle(api : API) -> Single<UIImage> {
        return request(api: api).mapImage()
    }
    open func requestImageObservable(api : API) -> Observable<UIImage> {
        return requestImageSingle(api: api).asObservable()
    }
    open func requestImageMaybe(api : API) -> Maybe<UIImage> {
        return requestImageSingle(api: api).asMaybe()
    }
    open func requestImageCompletable(api : API) -> Completable {
        return requestImageSingle(api: api).asCompletable()
    }
    
    // Must override these functions
    open class func getApiBuilder(api: API.Type) -> Self {
        return self.init()
    }
    
    open class func getApiBuilderWithoutLoadingIndicator(api: API.Type) -> Self {
        return self.init(enableLoadingActivity: false)
    }
}
