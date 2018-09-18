//
//  Environment.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 8/2/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//
//  - How to -
//
//  1. Project settings  -> project (not targe) -> info tab -> Configurations section -> Plus button to add new modes.
//  2. Add new row in Info.plist with key named : Configuration & value : $(CONFIGURATION)
//  3. Create and configure/Edit a Scheme.
//  Note : If you have pods in your project make pod install to avoid any problems (Must be done).
//  4. Clean & build
//  5. Create enum (Like this file) with all your modes and variables (Only add variable which there values are mode dependant, i.e : Has different value per mode like base url, auth token, etc..).
//  6. Conform to Protocol BuildVariantService and Pass your Enum to it then use that to get values ber mode
//  Ref : https://cocoacasts.com/switching-environments-with-configurations
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
