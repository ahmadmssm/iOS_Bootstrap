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
    
    open class func getApiBuilder(api: A.Type) -> T {
        return self.init().getBuilder(api: A.self)
    }
    
    open func getBuilder(api: A.Type) -> T {
        let apiProvider: T = T.init()
        return apiProvider
    }
    
    open func getBuilder() -> T {
        let apiProvider: T = T.init()
        return apiProvider
    }
}
