//
//  AlamofireRouter.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 3/18/20.
//

import Alamofire

public extension Session {

    func getRequestWith<API: AlamofireAPI>(baseURL: String, api: API) -> DataRequest  {
        let fullURL = (baseURL + api.route.path)
        let method = api.route.method
        let headers = api.headers?.toAlamofireHttpHeaders()
        let parameters = api.parameters?.values
        let encoding = api.parameters?.encoding ?? JSONEncoding.default
        let dataRequest = self.request(fullURL,
                                     method: method,
                                     parameters: parameters,
                                     encoding: encoding,
                                     headers: headers)
        return dataRequest.validate(statusCode: 200..<300)
    }

    func getUploadRequestWith<API: AlamofireAPI>(baseURL: String, api: API) -> UploadRequest {
        let fullURL = (baseURL + api.route.path)
        let method = api.route.method
        let headers = api.headers?.toAlamofireHttpHeaders()
        let formDataDictionary = api.parameters?.values ?? [:]
        let uploadRequest = self.upload(multipartFormData: { multipartFormData in
            multipartFormData.from(dictionary: formDataDictionary)
        }, to: fullURL, method: method, headers: headers)
        return uploadRequest.validate(statusCode: 200..<300)
    }

    func getDownloadRequestWith<API: AlamofireAPI>(baseURL: String,
                                                   api: API,
                                                   downloadDestination: @escaping DownloadRequest.Destination) -> DownloadRequest {
        let fullURL = (baseURL + api.route.path)
        let method = api.route.method
        let headers = api.headers?.toAlamofireHttpHeaders()
        let parameters = api.parameters?.values
        let encoding = api.parameters?.encoding ?? JSONEncoding.default
        let downloadRequest = self.download(fullURL,
                                          method: method,
                                          parameters: parameters,
                                          encoding: encoding,
                                          headers: headers,
                                          to: downloadDestination)
        return downloadRequest.validate(statusCode: 200..<300)
    }
}
