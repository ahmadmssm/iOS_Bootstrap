////
////  BaseStubbedApiBuilder.swift
////  iOS_Bootstrap
////
////  Created by Ahmad Mahmoud on 6/20/19.
////
//
//open class BaseStubbedApiBuilder<T, A, E> where
//                                            A: GenericAPIs,
//                                            E: BaseNetworkErrorHandler,
//                                            T: BaseStubbedRestClient<A, E> {
//    
//    public required init() {}
//    
//    public static func getInstance() -> Self { return self.init() }
//    
//    func initApiProvider() -> T {
//        let apiProvider: T = T.init()
//        return apiProvider
//    }
//    
//    open class func getStubbedApiBuilder(api: A.Type) -> T {
//        return self.init().getStubbedBuilder(api: A.self)
//    }
//    open class func getStubbedApiBuilderWithoutLoadingIndicator(api: A.Type) -> T {
//        return self.init().getStubbedBuilderWithoutLoadingIndicator(api: A.self)
//    }
//    open class func getStubbedTokenRefreshApiBuilder(api: A.Type) -> T {
//        return self.init().getStubbedTokenRefreshBuilder(api: A.self)
//    }
//    
//    open func getStubbedTokenRefreshBuilder(api: A.Type) -> T {
//        return initApiProvider()
//    }
//    open func getStubbedBuilderWithoutLoadingIndicator(api: A.Type) -> T {
//        return initApiProvider()
//    }
//    open func getStubbedBuilderWithoutLoadingIndicator() -> T {
//        return initApiProvider()
//    }
//    open func getStubbedTokenRefreshBuilder() -> T { return initApiProvider() }
//    open func getStubbedBuilder(api: A.Type) -> T { return initApiProvider() }
//    open func getStubbedBuilder() -> T { return initApiProvider() }
//}
