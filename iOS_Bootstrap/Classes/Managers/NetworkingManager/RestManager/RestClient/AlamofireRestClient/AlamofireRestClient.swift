//
//  AlamofireRestClient.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 3/17/20.
//

import Alamofire

open class AlamofireRestClient: BaseHTTPClient {

    private var sessionService: SessionService?
    private var loadingIndicatorService: LoadingIndicatorService?
    public private(set) lazy var networkReachabilityManager: NetworkReachabilityManager? = {
        return NetworkReachabilityManager()
    }()
    open lazy var alamofireSession: Session = {
        return Session(configuration: getAlamofireSessionConfiguration(),
                       interceptor: getRequestInterceptor(),
                       eventMonitors: getEventMonitorsList())
    }()
            
    public init(_ sessionService: SessionService? = nil,
                _ loadingIndicatorService: LoadingIndicatorService? = nil) {
        self.sessionService = sessionService
        self.loadingIndicatorService = loadingIndicatorService
        super.init()
    }
    
    open func shouldEnablePlugins() -> Bool { return true }
       
    open func shouldEnableConsoleLogging() -> Bool { return true }

    open func shouldEnableLoadingIndicator() -> Bool { return false }

    open override func shouldEnableRefreshToken() -> Bool {
        return sessionService?.shoudRetryWithAuthentication() ?? false
    }
    
    open func getRefreshTokenAPI() -> BaseRefreTokenAPI? {
        if (shouldEnableRefreshToken()) {
            fatalError("`getRefreshTokenAPI()` function should be implemented.")
        }
        return nil
    }
    
    open func getJSONDecoder() -> JSONDecoder {
        let decoder: JSONDecoder = JSONDecoder()
        decoder.keyDecodingStrategy = getJSONDecoderDecodingStrategy()
        return decoder
    }
    
    open func getJSONDecoderDecodingStrategy() -> JSONDecoder.KeyDecodingStrategy {
        return JSONDecoder.KeyDecodingStrategy.convertFromSnakeCase
    }
    
    open func getRequestInterceptor() -> RequestInterceptor? {
        return RequestInterceptor(sessionService: sessionService,
                                  refreTokenAPI: getRefreshTokenAPI(),
                                  requestIntercepters: getAdditionalRequestIntercepters(),
                                  additionalHeaders: getAdditionalHeaders())
    }
    
    open func getAdditionalHeaders() -> [String : String] {
        return [:]
    }
    
    open func getAdditionalRequestIntercepters() -> [RequestIntercepterProtocol] {
        return []
    }
    
    open func getEventMonitorsList() -> [EventMonitor] {
        var eventMonitors: [EventMonitor] = []
        if (self.shouldEnableConsoleLogging()) {
            eventMonitors.append(AlamofireLogger())
        }
        if (self.shouldEnableLoadingIndicator() && loadingIndicatorService != nil) {
            eventMonitors.append(AlamofireLoadingIndicator(loadingIndicatorService!))
        }
        return eventMonitors
    }
    
    open func getAlamofireSessionConfiguration() -> URLSessionConfiguration {
        let configuration = URLSessionConfiguration.af.default
        configuration.timeoutIntervalForRequest = 60
        configuration.timeoutIntervalForResource = 60
        configuration.requestCachePolicy = .useProtocolCachePolicy
        configuration.allowsCellularAccess = true
        return configuration
    }
        
    open func getRequestBuilder<API: AlamofireAPI>(api: API) -> DataRequest {
        return alamofireSession.getRequestWith(baseURL: getBaseURL(), api: api)
    }

    open func getMultipartRequestBuilder<API: AlamofireAPI>(api: API) -> UploadRequest {
        return alamofireSession.getUploadRequestWith(baseURL: getBaseURL(), api: api)
    }
    
    // https://stackoverflow.com/questions/41136560/setting-alamofire-custom-destination-file-name-instead-of-using-suggesteddownloa
    open func getDownloadRequestBuilder<API: AlamofireAPI>(api: API,
                                                           downloadDestination: @escaping DownloadRequest.Destination) -> DownloadRequest {
        return alamofireSession.getDownloadRequestWith(baseURL: getBaseURL(),
                                                       api: api,
                                                       downloadDestination: downloadDestination)
    }
    
    // apiErrorMessage = try JSONDecoder().decode(ApiErrorMessage.self, from: data)

//    open func processAlamofireError<T: Any & Codable>(requestReques: DataResponse<T, AFError>,
//                                                      error: Error) -> AlamofireError {
//        var customError: AlamofireError!
//        if let afError = error as? AFError {
//            switch afError {
//            case .responseValidationFailed(let reason):
//                print("Response validation failed: \(error.localizedDescription)")
//                print("Failure Reason: \(reason)")
//                error = AlamofireError
//            case .responseSerializationFailed(let reason):
//                    print("Response serialization failed: \(error.localizedDescription)")
//                    print("Failure Reason: \(reason)")
//            default:
//                print("Failure Reason: \(afError.localizedDescription)")
//            }
//        }
//        else if let error = error as? URLError {
//            print("URLError occurred: \(error)")
//        }
//        else {
//            print("Unknown error: \(error)")
//        }
//    }
        
    open func isConnectedToInternet() -> Bool {
        return networkReachabilityManager?.isReachable ?? false
    }

    open func cancelSpecificRequest(byEndpoint endpoint: String) {
        alamofireSession.session.getAllTasks{ sessionTasks in
            for task in sessionTasks {
                if task.originalRequest?.url?.absoluteString.contains(endpoint) ?? false {
                    task.cancel()
                }
            }
        }
    }
    
    open func canceUploadRequests() {
        alamofireSession.session
            .getTasksWithCompletionHandler({ _, uploadTasks, _ in
                uploadTasks.forEach { $0.cancel() }
        })
    }
   
    open func canceDownloadRequests() {
        alamofireSession.session.getTasksWithCompletionHandler({ _, _, downloadTasks in
            downloadTasks.forEach { $0.cancel() }
        })
    }
    
    open func cancelAllRequests() {
        alamofireSession.session.invalidateAndCancel()
    }
}
