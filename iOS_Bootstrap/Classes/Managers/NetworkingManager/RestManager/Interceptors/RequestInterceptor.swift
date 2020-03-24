//
//  RequestInterceptor.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 3/17/20.
//
//  Ref: https://www.avanderlee.com/swift/authentication-alamofire-request-adapter/
//

import Alamofire

open class RequestInterceptor: Alamofire.RequestInterceptor {

    private let lock: NSLock
    private var sessionService: SessionService?
    private var refreTokenAPI: BaseRefreTokenAPI?
    private let requestIntercepters: [RequestIntercepterProtocol]
    private let additionalHeaders: [String : String]
    private var requestsToRetry: [(RetryResult) -> Void] = []
    private var isFirstTime = true
    public var isRefreshing = false
    public var baseURL: String?
    
    
    init(sessionService: SessionService? = nil,
         refreTokenAPI: BaseRefreTokenAPI? = nil,
         requestIntercepters: [RequestIntercepterProtocol] = [],
         additionalHeaders: [String : String]) {
        self.refreTokenAPI = refreTokenAPI
        self.sessionService = sessionService
        self.requestIntercepters = requestIntercepters
        self.additionalHeaders = additionalHeaders
        self.lock = NSLock()
    }

    public func adapt(_ urlRequest: URLRequest,
               for session: Session,
               completion: @escaping (Result<URLRequest, Error>) -> Void) {
        if (isFirstTime) {
            isFirstTime = false
            baseURL = urlRequest.url?.baseURL?.absoluteString
        }
        completion(.success(getModifiedURLRequest(urlRequest, session)))
    }
    
    open func getModifiedURLRequest(_ urlRequest: URLRequest, _ session: Session) -> URLRequest {
        var request = urlRequest
      //  configureRefreshToken(&request)
        appendAdditionalHeaders(&request)
        appendAdditionalIntercepters(&request, session)
        return request
    }
   
    open func configureRefreshToken(_ urlRequest: inout URLRequest)  {
        if (sessionService?.hasValidSession() ?? false) {
               urlRequest.headers.add(.authorization(bearerToken: sessionService!.getAccessToken()))
        }
    }
    
    open func appendAdditionalHeaders(_ urlRequest: inout URLRequest)  {
        if (!additionalHeaders.isEmpty) {
            additionalHeaders.forEach { (arg0, arg1) in
                urlRequest.setValue(arg0, forHTTPHeaderField: arg1)
            }
        }
    }
    
    open func appendAdditionalIntercepters(_ urlRequest: inout URLRequest, _ session: Session) {
        var request = urlRequest
        if (!requestIntercepters.isEmpty) {
            requestIntercepters.forEach { modifiedRequest in
                request = modifiedRequest.getUpdatedURLRequest(request, for: session)
            }
        }
        urlRequest = request
    }
    
    public func retry(_ request: Request,
                      for session: Session,
                      dueTo error: Error,
                      completion: @escaping (RetryResult) -> Void) {
        if (sessionService?.shoudRetryWithAuthentication() ?? false) {
            lock.lock() ; defer { lock.unlock() }
            if let response = request.task?.response as? HTTPURLResponse {
                if (tokenShouldRefresh(previousResponse: response)) {
                    requestsToRetry.append(completion)
//                    refreshToken(completion: completion)
                }
                else {
                    /// The request did fail to satisfy the refresh condition.
                    /// Return the original error and don't retry the request.
                    completion(.doNotRetryWithError(error))
                }
            }
            /// The request did fail to satisfy the refresh condition.
            /// Return the original error and don't retry the request.
            completion(.doNotRetryWithError(error))
        }
    }
    
    open func tokenShouldRefresh(previousResponse: HTTPURLResponse) -> Bool {
        /// The request did fail due to a 401 Unauthorized response.
        return previousResponse.statusCode == 401
    }
    
    open func refreshToken(completion: @escaping (RetryResult) -> Void) {
        guard !isRefreshing else { return }
        isRefreshing = true
        AF.getRequestWith(baseURL: baseURL!, api: refreTokenAPI!)
          .response(queue: .global(qos: .background)) { [weak self] response in
            guard let strongSelf = self else { return }
            strongSelf.lock.lock(); defer { strongSelf.lock.unlock() }
            switch response.result {
            case .success(let data):
                let newAccessToken = strongSelf.sessionService!.extractTokenFrom(data: data!)
                strongSelf.sessionService?.save(accessToken: newAccessToken)
                /// After updating the token we can retry the original request.
                // Retry every request if there were many concurrent requests
                if (strongSelf.requestsToRetry.count > 1) {
                    strongSelf.requestsToRetry.forEach { $0(.retry) }
                    strongSelf.requestsToRetry.removeAll()
                }
                else {
                    completion(.retry)
                }
                break
            case .failure(let error):
                if (strongSelf.requestsToRetry.count > 1) {
                    strongSelf.requestsToRetry.forEach { $0(.doNotRetryWithError(error)) }
                    strongSelf.requestsToRetry.removeAll()
                }
                else {
                    completion(.doNotRetryWithError(error))
                }
                break
            }
            strongSelf.isRefreshing = false
        }
    }
}
