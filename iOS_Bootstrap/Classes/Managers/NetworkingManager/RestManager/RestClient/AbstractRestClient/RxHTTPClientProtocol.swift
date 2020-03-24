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
    
    func requesData<API: AlamofireAPI>(api: API) -> Single<Data>
       
    func request<T: Decodable, API: AlamofireAPI>(api: API) -> Observable<(T?, Progress?)>

    func request<API: AlamofireAPI>(api: API) -> Observable<(Any?, Progress?)>
    
    func requestData<API: AlamofireAPI>(api: API) -> Observable<(Data?, Progress?)>

    func request<API: AlamofireAPI>(api: API) -> Completable
    
    func multiPartRequest<T: Decodable, API: AlamofireAPI>(api: API) -> Single<T>
          
    func multiPartRequest<API: AlamofireAPI>(api: API) -> Single<Any>

    func multiPartDataRequest<API: AlamofireAPI>(api: API) -> Single<Data>

    func multiPartRequest<T: Decodable, API: AlamofireAPI>(api: API) -> Observable<(T?, Progress?)>
       
    func multiPartRequest<API: AlamofireAPI>(api: API) -> Observable<(Any?, Progress?)>

    func multiPartDataRequest<API: AlamofireAPI>(api: API) -> Observable<(Data?, Progress?)>

    func multiPartRequest<API: AlamofireAPI>(api: API) -> Completable
}
