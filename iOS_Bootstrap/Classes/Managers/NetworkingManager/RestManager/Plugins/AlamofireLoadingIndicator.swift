//
//  AlamofireLoadingIndicator.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 3/18/20.
//

import Alamofire

open class AlamofireLoadingIndicator: EventMonitor {
    
    private let loadingIndicatorService: LoadingIndicatorService
    
    public init(_ alamofireLoadingIndicatorService: LoadingIndicatorService) {
        self.loadingIndicatorService = alamofireLoadingIndicatorService
    }
    
    public func request(_ request: DataRequest, didValidateRequest urlRequest: URLRequest?, response: HTTPURLResponse, data: Data?, withResult result: Request.ValidationResult) {        DispatchQueue.main.async {
            self.loadingIndicatorService.showLoader()
        }
    }
    
    public func requestDidResume(_ request: Request) {
        DispatchQueue.main.async {
            self.loadingIndicatorService.showLoader()
        }
    }
    
    public func request<Value>(_ request: DataRequest,
                               didParseResponse response: AFDataResponse<Value>) {
        DispatchQueue.main.async {
            self.loadingIndicatorService.hideLoader()
        }
    }
    
    public func requestDidCancel(_ request: Request) {
        DispatchQueue.main.async {
            self.loadingIndicatorService.hideLoader()
        }
    }
}
