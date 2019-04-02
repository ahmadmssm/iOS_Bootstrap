//
//  BaseAPI.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 4/1/19.
//

open class BaseAPI: GenericAPIs {
    open var baseURL: URL { return URL(string: "")! }
    open var headers: [String: String]? { return [ : ] }
    open var parameters: Parameters? { return nil }
    open var multipartBody: [Moya.MultipartFormData]? { return nil }
    open var route: Route { return .post("") }
    open var task: Task {
        if (self.multipartBody != nil) {
            return .uploadMultipart(self.multipartBody!)
        }
        else {
            guard let parameters = self.parameters else { return .requestPlain }
            return .requestParameters(parameters: parameters.values,
                                      encoding: parameters.encoding)
        }
    }
    open var sampleData: Data { return Data() }
    
    public init() {}
}
