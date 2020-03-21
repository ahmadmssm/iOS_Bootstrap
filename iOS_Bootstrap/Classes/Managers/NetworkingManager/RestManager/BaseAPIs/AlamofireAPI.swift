//
//  AlamofireAPI.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 3/17/20.
//

import Alamofire

public protocol AlamofireAPI {
    
    /// Returns `Route` which contains HTTP method and endpoint.
    ///
    /// Example:
    ///
    /// ```
    /// var route: Route {
    ///   return .get("/me")
    /// }
    /// ```
    var route: Route { get }
    var headers: [String: String]? { get }
    var parameters: Parameters? { get }
}

public extension AlamofireAPI {
    var path: String { return self.route.path }
    var method: Alamofire.HTTPMethod { return self.route.method }
    var headers: [String: String]? { return nil }
    var parameters: Parameters? { return nil }
}
