//
//  RxAlamofireRestClient.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 3/18/20.
//

import RxSwift
import Alamofire

open class RxAlamofireRestClient: AlamofireRestClient, RxAlamofireClientProtocol {
        
    open func request<T: Decodable, API: AlamofireAPI>(api: API) -> Single<T> {
        return Single.create { [weak self] single -> Disposable in
            if let self = self {
               self.getRequestBuilder(api: api)
                   .responseDecodable(of: T.self, decoder: self.getJSONDecoder()) { response in
                    switch response.result {
                    case .success(let responseObject):
                        single(.success(responseObject))
                        break
                    case .failure(let error):
                        single(.error(error))
                        break
                    }
               }
            }
            else {
                single(.error(RestUtils.rxAlamofireUnknownError))
            }
            return Disposables.create()
        }
    }
    
    open func request<API: AlamofireAPI>(api: API) -> Single<Any> {
        return Single.create { [weak self] single -> Disposable in
            if let self = self {
                self.getRequestBuilder(api: api)
                    .responseJSON(completionHandler: { response in
                        switch response.result {
                        case .success(let responseObject):
                            single(.success(responseObject))
                            break
                        case .failure(let error):
                            single(.error(error))
                            break
                        }
                    })
            }
            else {
                single(.error(RestUtils.rxAlamofireUnknownError))
            }
            return Disposables.create()
        }
    }
    
    open func request<T: Decodable, API: AlamofireAPI>(api: API) -> Observable<(T?, Progress?)> {
        return Observable.create { [weak self] observer -> Disposable in
            if let self = self {
               self.getRequestBuilder(api: api)
                   .downloadProgress { progress in
                        // This closure is NOT called on the main queue for performance
                        observer.on(.next((nil, progress)))
                   }
                   .responseDecodable(of: T.self, decoder: self.getJSONDecoder()) { response in
                    switch response.result {
                    case .success(let responseObject):
                        observer.on(.next((responseObject, Progress.current() ?? nil)))
                        observer.on(.completed)
                        break
                    case .failure(let error):
                        observer.on(.error(error))
                        break
                    }
               }
            }
            else {
                observer.on(.error(RestUtils.rxAlamofireUnknownError))
            }
            return Disposables.create()
        }
    }

    open func request<API: AlamofireAPI>(api: API) -> Observable<(Any?, Progress?)> {
        return Observable.create { [weak self] observer -> Disposable in
            if let self = self {
               self.getRequestBuilder(api: api)
                   .downloadProgress { progress in
                        // This closure is NOT called on the main queue for performance
                        observer.on(.next((nil, progress)))
                   }
                   .responseJSON( completionHandler: { response in
                    switch response.result {
                    case .success(let responseObject):
                        observer.on(.next((responseObject, Progress.current() ?? nil)))
                        observer.on(.completed)
                        break
                    case .failure(let error):
                        observer.on(.error(error))
                        break
                    }
               })
            }
            else {
                observer.on(.error(RestUtils.rxAlamofireUnknownError))
            }
            return Disposables.create()
        }
    }

    open func request<API: AlamofireAPI>(api: API) -> Completable {
        return Completable.create { [weak self] completable -> Disposable in
            if let self = self {
                   self.getRequestBuilder(api: api)
                       .responseJSON(completionHandler: { response in
                           switch response.result {
                           case .success( _):
                                completable(.completed)
                               break
                           case .failure(let error):
                               completable(.error(error))
                               break
                           }
                       })
               }
               else {
                   completable(.error(RestUtils.rxAlamofireUnknownError))
               }
            return Disposables.create()
        }
    }
    
    open func multiPartRequest<T: Decodable, API: AlamofireAPI>(api: API) -> Single<T> {
        return Single.create { [weak self] single -> Disposable in
               if let self = self {
                  self.getMultipartRequestBuilder(api: api)
                      .responseDecodable(of: T.self, decoder: self.getJSONDecoder()) { response in
                       switch response.result {
                       case .success(let responseObject):
                           single(.success(responseObject))
                           break
                       case .failure(let error):
                           single(.error(error))
                           break
                       }
                  }
               }
               else {
                   single(.error(RestUtils.rxAlamofireUnknownError))
               }
               return Disposables.create()
           }
       }
       
    open func multiPartRequest<API: AlamofireAPI>(api: API) -> Single<Any> {
        return Single.create { [weak self] single -> Disposable in
               if let self = self {
                   self.getMultipartRequestBuilder(api: api)
                       .responseJSON(completionHandler: { response in
                           switch response.result {
                           case .success(let responseObject):
                               single(.success(responseObject))
                               break
                           case .failure(let error):
                               single(.error(error))
                               break
                           }
                       })
               }
               else {
                   single(.error(RestUtils.rxAlamofireUnknownError))
               }
               return Disposables.create()
           }
    }
    
    open func multiPartRequest<T: Decodable, API: AlamofireAPI>(api: API) -> Observable<(T?, Progress?)> {
        return Observable.create { [weak self] observer -> Disposable in
            if let self = self {
               self.getMultipartRequestBuilder(api: api)
                   .downloadProgress { progress in
                        // This closure is NOT called on the main queue for performance
                        observer.on(.next((nil, progress)))
                   }
                   .responseDecodable(of: T.self, decoder: self.getJSONDecoder()) { response in
                    switch response.result {
                    case .success(let responseObject):
                        observer.on(.next((responseObject, Progress.current() ?? nil)))
                        observer.on(.completed)
                        break
                    case .failure(let error):
                        observer.on(.error(error))
                        break
                    }
               }
            }
            else {
                observer.on(.error(RestUtils.rxAlamofireUnknownError))
            }
            return Disposables.create()
        }
    }
    
    open func multiPartRequest<API: AlamofireAPI>(api: API) -> Observable<(Any?, Progress?)> {
           return Observable.create { [weak self] observer -> Disposable in
               if let self = self {
                  self.getMultipartRequestBuilder(api: api)
                      .uploadProgress(closure: { uploadProgress in
                        // This closure is NOT called on the main queue for performance
                        observer.on(.next((nil, uploadProgress)))
                      })
                      .downloadProgress { downloadProgress in
                        
                      }
                      .responseJSON( completionHandler: { response in
                       switch response.result {
                       case .success(let responseObject):
                           observer.on(.next((responseObject, Progress.current() ?? nil)))
                           observer.on(.completed)
                           break
                       case .failure(let error):
                           observer.on(.error(error))
                           break
                       }
                  })
               }
               else {
                   observer.on(.error(RestUtils.rxAlamofireUnknownError))
               }
               return Disposables.create()
           }
       }
    
    open func multiPartRequest<API: AlamofireAPI>(api: API) -> Completable {
              return Completable.create { [weak self] completable -> Disposable in
                  if let self = self {
                      self.getMultipartRequestBuilder(api: api)
                          .responseJSON(completionHandler: { response in
                              switch response.result {
                              case .success( _):
                                   completable(.completed)
                                  break
                              case .failure(let error):
                                  completable(.error(error))
                                  break
                              }
                          })
                  }
                  else {
                      completable(.error(RestUtils.rxAlamofireUnknownError))
                  }
                  return Disposables.create()
            }
        }

    open func downloadRequest<T: Decodable, API: AlamofireAPI>(api: API, downloadDestination: @escaping DownloadRequest.Destination) -> Single<T> {
          return Single.create { [weak self] single -> Disposable in
              if let self = self {
                  self.getDownloadRequestBuilder(api: api, downloadDestination: downloadDestination)
                      .responseDecodable(of: T.self, decoder: self.getJSONDecoder()) { response in
                          switch response.result {
                          case .success(let responseObject):
                              single(.success(responseObject))
                              break
                          case .failure(let error):
                              single(.error(error))
                              break
                          }
                      }
                  }
              else {
                  single(.error(RestUtils.rxAlamofireUnknownError))
              }
              return Disposables.create()
          }
      }
    
    open func downloadRequest<API: AlamofireAPI>(api: API, downloadDestination: @escaping DownloadRequest.Destination) -> Single<Any> {
             return Single.create { [weak self] single -> Disposable in
                    if let self = self {
                      self.getDownloadRequestBuilder(api: api, downloadDestination: downloadDestination)
                            .responseJSON(completionHandler: { response in
                                switch response.result {
                                case .success(let responseObject):
                                    single(.success(responseObject))
                                    break
                                case .failure(let error):
                                    single(.error(error))
                                    break
                                }
                            })
                    }
                    else {
                        single(.error(RestUtils.rxAlamofireUnknownError))
                    }
                    return Disposables.create()
                }
         }
    
    open func downloadRequest<T: Decodable, API: AlamofireAPI>(api: API,
                                       downloadDestination: @escaping DownloadRequest.Destination) -> Observable<(T?, Progress?)> {
        return Observable.create { [weak self] observer -> Disposable in
            if let self = self {
               self.getDownloadRequestBuilder(api: api, downloadDestination: downloadDestination)
                   .downloadProgress { progress in
                        // This closure is NOT called on the main queue for performance
                        observer.on(.next((nil, progress)))
                   }
                   .responseDecodable(of: T.self, decoder: self.getJSONDecoder()) { response in
                    switch response.result {
                    case .success(let responseObject):
                        observer.on(.next((responseObject, Progress.current() ?? nil)))
                        observer.on(.completed)
                        break
                    case .failure(let error):
                        observer.on(.error(error))
                        break
                    }
               }
            }
            else {
                observer.on(.error(RestUtils.rxAlamofireUnknownError))
            }
            return Disposables.create()
        }
    }
  
    open func downloadRequest<API: AlamofireAPI>(api: API,
                                         downloadDestination: @escaping DownloadRequest.Destination) -> Observable<(Any?, Progress?)> {
          return Observable.create { [weak self] observer -> Disposable in
              if let self = self {
                 self.getDownloadRequestBuilder(api: api, downloadDestination: downloadDestination)
                     .downloadProgress { progress in
                          // This closure is NOT called on the main queue for performance
                          observer.on(.next((nil, progress)))
                     }
                    .responseJSON( completionHandler: { response in
                        switch response.result {
                          case .success(let responseObject):
                              observer.on(.next((responseObject, Progress.current() ?? nil)))
                              observer.on(.completed)
                              break
                          case .failure(let error):
                              observer.on(.error(error))
                          break
                      }
                 })
              }
              else {
                  observer.on(.error(RestUtils.rxAlamofireUnknownError))
              }
              return Disposables.create()
          }
      }
    
    open func downloadRequest<API: AlamofireAPI>(api: API, downloadDestination: @escaping DownloadRequest.Destination) -> Completable {
                return Completable.create { [weak self] completable -> Disposable in
                    if let self = self {
                    self.getDownloadRequestBuilder(api: api, downloadDestination: downloadDestination)
                            .responseJSON(completionHandler: { response in
                                switch response.result {
                                case .success( _):
                                    completable(.completed)
                                    break
                                case .failure(let error):
                                    completable(.error(error))
                                    break
                                }
                            })
                    }
                    else {
                        completable(.error(RestUtils.rxAlamofireUnknownError))
                    }
                    return Disposables.create()
            }
        }
}
