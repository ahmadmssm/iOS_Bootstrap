//
//  RxSchedulers.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 12/21/18.
//

import RxSwift

public struct RxSchedulers {
    public static let main = MainScheduler.instance
    public static let backgroundConcurrentScheduler = ConcurrentDispatchQueueScheduler(qos: .background)
    public let workerScheduler = ConcurrentDispatchQueueScheduler(qos: .default)
    public static var imageLoading: SerialDispatchQueueScheduler {
        return SerialDispatchQueueScheduler(internalSerialQueueName: "imageLoadingScheduler")
    }
    public static var backgroundSerialScheduler: SerialDispatchQueueScheduler {
        return SerialDispatchQueueScheduler(qos: .background)
    }
    
    // static let IO_THREAD = OperationQueueScheduler(operationQueue: )
    
    //  static let CurrentThreadScheduler = Schde
    //    static let ConcurrentMainScheduler = ConcurrentMainScheduler.
    //    static let CurrentThreadScheduler = CurrentThreadScheduler.instance
    //
    //    static let serialUtility = SerialDispatchQueueScheduler(qos: .utility)
    //    static let concurrentUtility = ConcurrentDispatchQueueScheduler.init(qos: .utility)
    //
    //    static let serialUser = SerialDispatchQueueScheduler(qos: .userInitiated)
    //    static let concurrentUser = ConcurrentDispatchQueueScheduler(qos: .userInitiated)
    //
    //    static let serialInteractive = SerialDispatchQueueScheduler(qos: .userInteractive)
    //    static let concurrentInteractive = ConcurrentDispatchQueueScheduler(qos: .userInteractive)
    
    public static func getCustomSerialBackgroundScheduler(name: String) -> SerialDispatchQueueScheduler {
        return SerialDispatchQueueScheduler(internalSerialQueueName: name)
    }
}

