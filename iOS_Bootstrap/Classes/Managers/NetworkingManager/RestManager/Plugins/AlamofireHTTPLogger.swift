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
        //
        let url = httpRequest.flatMap { $0.url?.description } ?? "No URL"
        logger.debugPrint("HTTP URL: " + url + "\n")
        let headers = httpRequest.flatMap { $0.allHTTPHeaderFields.map { $0.description } } ?? "No HTTP Headers"
        logger.debugPrint("HTTP Headers: " + headers + "\n")
        let method = httpRequest.flatMap { $0.method.map { $0.rawValue } } ?? "No HTTP Method"
        logger.debugPrint("HTTP URL: " + method + "\n")
        let endpoint = httpRequest.flatMap { $0.httpBody.map { String(decoding: $0, as: UTF8.self) } } ?? "No body"
        logger.debugPrint("HTTP Endpoint: " + endpoint + "\n")

        let body = httpRequest.flatMap { $0.httpBody.map { String(decoding: $0, as: UTF8.self) } } ?? "No body"
        logger.debugPrint("Body: " + body + "\n")
    }

    public func requestIsRetrying(_ request: Request) {
        let httpRequest = request.request
        logger.debugPrint("⚡️ Retrying request " + httpRequest.debugDescription)
    }
    
    public func request<Value>(_ request: DataRequest,
                               didParseResponse response: AFDataResponse<Value>) {
        logger.debugPrint("HTTP Endpoint: \(response.debugDescription)")
    }
    
    public func requestDidCancel(_ request: Request) {
        logger.debugPrint("⚡️ Request cencelled ")
    }
}
