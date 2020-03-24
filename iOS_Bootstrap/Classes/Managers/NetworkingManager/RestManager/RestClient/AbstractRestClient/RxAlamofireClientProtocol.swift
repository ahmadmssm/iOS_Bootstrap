//
//  RxAlamofireClientProtocol.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 3/20/20.
//

import RxSwift
import Alamofire
import Foundation

public protocol RxAlamofireClientProtocol: RxHTTPClientProtocol {
    
    func downloadRequest<T: Decodable, API: AlamofireAPI>(api: API, downloadDestination: @escaping DownloadRequest.Destination) -> Single<T>

    func downloadRequest<API: AlamofireAPI>(api: API, downloadDestination: @escaping DownloadRequest.Destination) -> Single<Any>

    func downloadDataRequest<API: AlamofireAPI>(api: API, downloadDestination: @escaping DownloadRequest.Destination) -> Single<Data>

    func downloadRequest<T: Decodable, API: AlamofireAPI>(api: API,
                                          downloadDestination: @escaping DownloadRequest.Destination) -> Observable<(T?, Progress?)>

    func downloadRequest<API: AlamofireAPI>(api: API,
                                            downloadDestination: @escaping DownloadRequest.Destination) -> Observable<(Any?, Progress?)>

    func downloadRequest<API: AlamofireAPI>(api: API,
                                            downloadDestination: @escaping DownloadRequest.Destination) -> Observable<(Data?, Progress?)>

    func downloadRequest<API: AlamofireAPI>(api: API, downloadDestination: @escaping DownloadRequest.Destination) -> Completable
}
