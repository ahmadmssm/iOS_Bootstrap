//
//  HeadersDictionaryExtension.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 3/20/20.
//

import Alamofire

public extension Dictionary where Key == String, Value == String {
    func toAlamofireHttpHeaders() -> HTTPHeaders {
        var header: HTTPHeader? = nil
        var headersArray: [HTTPHeader] = []
        self.forEach { args in
            header = HTTPHeader(name: args.key, value: args.value)
            headersArray.append(header!)
        }
        return HTTPHeaders(headersArray)
    }
}
