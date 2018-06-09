import class Foundation.DispatchQueue

/// `APIProvider` overrides `parameterEncoding` and `httpHeaderFields` of the
/// `endpointClosure` with `SugarTargetType`. `APIProvider` can be used only with
/// `SugarTargetType`.

open class APIsProvider<Target: GenericAPIs>: MoyaProvider<Target> {
    
    override public init(
        endpointClosure: @escaping EndpointClosure = MoyaProvider.defaultEndpointMapping,
        requestClosure: @escaping RequestClosure = APIsProvider.defaultRequestMapping,
        stubClosure: @escaping StubClosure = MoyaProvider.neverStub,
        callbackQueue: DispatchQueue? = nil,
        manager: Manager = MoyaProvider<Target>.defaultAlamofireManager(),
        plugins: [PluginType] = [],
        trackInflights: Bool = false
        ) {
        func customEndpointClosure(target: Target) -> Endpoint {
            let endpoint = endpointClosure(target)
            return Endpoint(
                url: target.url.absoluteString,
                sampleResponseClosure: endpoint.sampleResponseClosure,
                method: endpoint.method,
                task: endpoint.task,
                httpHeaderFields: endpoint.httpHeaderFields
            )
        }
        super.init(
            endpointClosure: customEndpointClosure,
            requestClosure: requestClosure,
            stubClosure: stubClosure,
            callbackQueue: callbackQueue,
            manager: manager,
            plugins: plugins,
            trackInflights: trackInflights
        )
    }
    
}


