//
//  MoyaResponseHandlerPlugin.swift
//  Pods
//
//  Created by Levi Bostian on 8/20/17.
//
//

import Foundation
import Moya
import Result

open class Singleton {
    
    public var errorHandler: LucidErrorMessageProvider?
    
    public static let sharedInstance = Singleton()
    
    private init() {
    }
}

/**
 Configure Lucid. Set defaults for the plugin.
 */
open class GenericErrorConfiguration {
    
    open class func setDefaultErrorHandler(_ errorHandler: LucidErrorMessageProvider?) {
        Singleton.sharedInstance.errorHandler = errorHandler
    }
    
}


