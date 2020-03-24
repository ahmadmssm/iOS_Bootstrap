//
//  RequestIntercepterProtocol.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 3/20/20.
//

import Alamofire

public protocol RequestIntercepterProtocol {
     func getUpdatedURLRequest(_ urlRequest: URLRequest, for session: Session) -> URLRequest
}
