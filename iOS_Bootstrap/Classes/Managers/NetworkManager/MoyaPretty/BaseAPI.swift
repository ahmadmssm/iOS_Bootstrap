//
//  BaseAPI.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 4/1/19.
//
// Ref: https://github.com/Moya/Moya/blob/master/docs/Targets.md

open class BaseAPI: GenericAPIs {
    open var baseURL: URL { return URL(string: "")! }
    open var headers: [String: String]? { return [ : ] }
    /// This var returns Bool, and enables sending URL params and body params.
    ///
    /// - Warning: Enable this var or **enableCompositeMultiPartRequest** but if you enabled both, only the value of this will be used and the other will be ignored.
    ///
    /// - Returns: Booelan, default is false.
    open var enableCompositeRequest: Bool { return false }
    /// This var returns Bool, and enables sending URL params and body params.
    ///
    /// - Warning: Enable this var or **enableCompositeRequest** but if you enabled both, only the value of **enableCompositeRequest** be used and the value of this will be ignored.
    ///
    /// - Returns: Booelan, default is false.
    open var enableCompositeMultiPartRequest: Bool { return false }
    open var compositeURLparameters: [String : Any]? { return nil }
    open var parameters: Parameters? { return nil }
    open var encodableBody: Encodable? { return nil }
    open var dataBody: Data? { return nil }
    open var multipartBody: [Moya.MultipartFormData]? { return nil }
    open var route: Route { return .post("") }
    //
    open var task: Task {
        if (self.compositeURLparameters != nil) {
            if (self.enableCompositeRequest) {
                return self.compositeRequestTask
            }
            else if (self.enableCompositeMultiPartRequest &&
                     self.multipartBody != nil) {
                return .uploadCompositeMultipart(self.multipartBody!,
                                                 urlParameters: self.compositeURLparameters!)
            }
            else {
                return self.defaultRequestTask
            }
        }
        else {
            return self.defaultRequestTask
        }
    }
    
    private var compositeRequestTask: Task {
        if (self.parameters != nil) {
            return .requestCompositeParameters(bodyParameters: parameters!.values,
                                               bodyEncoding: parameters!.encoding,
                                               urlParameters: self.compositeURLparameters!)
        }
        else if (self.dataBody != nil) {
            return .requestCompositeData(bodyData: self.dataBody!,
                                         urlParameters: self.compositeURLparameters!)
        }
        else {
            return self.defaultRequestTask
        }
    }
    
    private var defaultRequestTask: Task {
        if (self.multipartBody != nil) {
            return .uploadMultipart(self.multipartBody!)
        }
        else if (self.parameters != nil) {
            return .requestParameters(parameters: parameters!.values,
                                      encoding: parameters!.encoding)
        }
        else if (self.dataBody != nil) {
            return .requestData(self.dataBody!)
        }
        else if (self.encodableBody != nil) {
            return .requestJSONEncodable(self.encodableBody!)
        }
        else {
            return .requestPlain
        }
    }
    
    open var sampleData: Data { return Data() }

    public init() {}
}
