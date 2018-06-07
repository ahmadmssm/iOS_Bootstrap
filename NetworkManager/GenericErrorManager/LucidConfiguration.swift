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

public class Singleton {
    
    public var errorHandler: GenericErrorMessageProvider?
    
    public static let sharedInstance = Singleton()
    
    private init() {
    }
}

/**
 Configure Lucid. Set defaults for the plugin.
 */
public class LucidConfiguration {
    
    public class func setDefaultErrorHandler(_ errorHandler: GenericErrorMessageProvider?) {
        Singleton.sharedInstance.errorHandler = errorHandler
    }
    
}


