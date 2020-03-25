//
//  AlamofireHTTPLogger.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 3/17/20.
//

import Alamofire

open class AlamofireLogger: EventMonitor {
    
    private let logger = AlamofireActivityLogger()
    
    public func requestDidResume(_ request: Request) {
        logger.debugPrint("🚀 Running request")
        let httpRequest = request.request
        let url = httpRequest.flatMap { $0.url?.description } ?? "No URL"
        logger.debugPrint("HTTP URL: " + url)
        let headers = httpRequest.flatMap { $0.allHTTPHeaderFields.map { $0.description } } ?? "No HTTP Headers"
        logger.debugPrint("HTTP Headers: " + headers)
        let method = httpRequest.flatMap { $0.method.map { $0.rawValue } } ?? "No HTTP Method"
        logger.debugPrint("HTTP Method: " + method)
        let endpoint = httpRequest.unsafelyUnwrapped.url?.absoluteURL.path ?? "No endpoint"
        logger.debugPrint("HTTP Endpoint: " + endpoint)
        logger.debugPrint("Request body: ")
        if let httpBody = httpRequest?.urlRequest?.httpBody {
            logger.debugPrettyPrint(String(decoding: httpBody, as: UTF8.self))
        }
        else {
            logger.debugPrint("No Request body")
        }
    }

    public func requestIsRetrying(_ request: Request) {
        let httpRequest = request.request
        logger.debugPrint("⚡️Retrying request")
        logger.debugPrint(httpRequest.debugDescription)
    }
    
    public func request(_ request: DataRequest, didValidateRequest urlRequest: URLRequest?, response: HTTPURLResponse, data: Data?, withResult result: Request.ValidationResult) {
        logger.debugPrint("⚡️⚡️ Response:")
        logger.debugPrint(response.debugDescription)
        logger.debugPrint("⚡️⚡️ Status code: \(response.statusCode)")
        logger.debugPrettyPrint(data)
    }
    
    public func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value, AFError>) {
        switch response.result {
        case .success(_):
            logger.debugPrint("⚡️ Response parsing finished successfully")
            break
        case .failure(let error):
            logger.debugPrint("⚡️ Response parsing finished with error : \n \(String(describing: error.errorDescription))")
            break
        }
    }
    
    public func requestDidSuspend(_ request: Request) {
        logger.debugPrint("⚡️ Request Suspended")
    }
    
    public func requestDidCancel(_ request: Request) {
        logger.debugPrint("⚡️ Request Cencelled")
    }
}
