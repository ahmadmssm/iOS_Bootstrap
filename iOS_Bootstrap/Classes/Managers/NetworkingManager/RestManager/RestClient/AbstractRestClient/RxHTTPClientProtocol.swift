//
//  RxHTTPClientProtocol.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 3/20/20.
//

import RxSwift

public protocol RxHTTPClientProtocol {
    
    func request<T: Decodable, API: AlamofireAPI>(api: API) -> Single<T>
       
    func request<API: AlamofireAPI>(api: API) -> Single<Any>
       
    func request<T: Decodable, API: AlamofireAPI>(api: API) -> Observable<(T?, Progress?)>

    func request<API: AlamofireAPI>(api: API) -> Observable<(Any?, Progress?)>

    func request<API: AlamofireAPI>(api: API) -> Completable
    
    func multiPartRequest<T: Decodable, API: AlamofireAPI>(api: API) -> Single<T>
          
    func multiPartRequest<API: AlamofireAPI>(api: API) -> Single<Any>
       
    func multiPartRequest<T: Decodable, API: AlamofireAPI>(api: API) -> Observable<(T?, Progress?)>
       
    func multiPartRequest<API: AlamofireAPI>(api: API) -> Observable<(Any?, Progress?)>
       
    func multiPartRequest<API: AlamofireAPI>(api: API) -> Completable
}
