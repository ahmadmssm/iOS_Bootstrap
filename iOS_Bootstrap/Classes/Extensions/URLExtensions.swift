//
//  URLExtensions.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 3/22/19.
//

// Query parameters
public extension URL {
    var queryParameters: [String: String]? {
        guard let components = URLComponents(url: self, resolvingAgainstBaseURL: true), let queryItems = components.queryItems else {
            return nil
        }
        var parameters = [String: String]()
        for item in queryItems {
            parameters[item.name] = item.value
        }
        return parameters
    }
}
