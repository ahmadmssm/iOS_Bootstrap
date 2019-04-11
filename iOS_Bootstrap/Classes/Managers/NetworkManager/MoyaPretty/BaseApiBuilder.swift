//
//  BaseApiBuilder.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 4/1/19.
//

open class BaseApiBuilder<T, A> where
                                    A: GenericAPIs,
                                    T: BaseConnectorConfigurations<A> {
    
    public required init() {}
    
    public static func getInstance() -> Self { return self.init() }
    
    func initApiProvider() -> T {
        let apiProvider: T = T.init()
        return apiProvider
    }
    
    open class func getApiBuilder(api: A.Type) -> T {
        return self.init().getBuilder(api: A.self)
    }
    open class func getApiBuilderWithoutLoadingIndicator(api: A.Type) -> T {
        return self.init().getBuilder(api: A.self)
    }
    open class func getTokenRefreshApiBuilder(api: A.Type) -> T {
        return self.init().getTokenRefreshBuilder(api: A.self)
    }
    
    open func getTokenRefreshBuilder(api: A.Type) -> T { return initApiProvider() }
    open func getTokenRefreshBuilder() -> T { return initApiProvider() }
    open func getBuilder(api: A.Type) -> T { return initApiProvider() }
    open func getBuilder() -> T { return initApiProvider() }
    open func getBuilderWithoutLoadingIndicator(api: A.Type) -> T {
        return initApiProvider()
    }
    open func getBuilderWithoutLoadingIndicator() -> T { return initApiProvider() }
}
