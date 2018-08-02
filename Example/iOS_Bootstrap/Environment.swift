//
//  EnvironmentConfiguration.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 8/2/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

public enum Environment: String {

    // Modes
    case Debug
    case Staging
    case Release
    
    // Variables
    var baseURL: String {
        switch self {
        case .Debug:
            return "https://debug-api.myservice.com"
        case .Staging:
            return "https://staging-api.myservice.com"
        case .Release:
            return "https://api.myservice.com"
        }
    }
    
//    var token: String {
//        switch self {
//        case .Staging: return "lktopir156dsq16sbi8"
//        case .Release: return "5zdsegr16ipsbi1lktp"
//        }
//    }
    
}
