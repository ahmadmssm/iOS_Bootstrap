//
//  BaseRefreTokenAPI.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 3/18/20.
//

open class BaseRefreTokenAPI: AlamofireAPI {
    
    public var route: Route {
        fatalError("`route` should be implemented.")
    }
    
    public init() {}
}
