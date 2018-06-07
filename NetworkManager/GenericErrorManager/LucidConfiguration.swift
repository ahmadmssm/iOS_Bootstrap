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
    
    public var errorHandler: LucidErrorMessageProvider?
    
    public static let sharedInstance = Singleton()
    
    private init() {
    }
}

/**
 Configure Lucid. Set defaults for the plugin.
 */
public class LucidConfiguration {
    
    public class func setDefaultErrorHandler(_ errorHandler: LucidErrorMessageProvider?) {
        Singleton.sharedInstance.errorHandler = errorHandler
    }
    
}


