////
////  BaseNetworkErrorHandler.swift
////  iOS_Bootstrap_Example
////
////  Created by Ahmad Mahmoud on 6/9/18.
////  Copyright © 2018 CocoaPods. All rights reserved.
////
//
//open class BaseNetworkErrorHandler<ErrorModel: Decodable>: GenericErrorHandler {
//    
//    private var errorModel: ErrorModel?
//    open var errorMessage : String?
//    
//    
//    public required init() {}
//    
//    public func getNetworkError() -> ErrorModel {
//        if (errorModel == nil) {
//            errorModel = configureDefaultErrorModel()
//        }
//        return errorModel!
//    }
//    
//    open func serializeError(errorBody: String) {
//        if let errorObj = errorBody.toModelWithCamelCaseKeys(model: ErrorModel.self) {
//            errorModel = errorObj
//        }
//        else {
//            errorModel = configureDefaultErrorModel()
//        }
//    }
//    
//    open func configureDefaultErrorModel() -> ErrorModel {
//        fatalError("Must Override")
//    }
//    
//    open func statusCodeError(_ statusCode: Int, errorBody: String?, request: URLRequest?, response: URLResponse?) -> String {
//        return "Unknown error !"
//    }
//    
//    open func networkingError(_ error: LucidMoyaNetworkingError) -> String {
//        return ""
//    }
//    
//    open func moyaError(_ error: MoyaError) -> String {
//        return ""
//    }
//}
