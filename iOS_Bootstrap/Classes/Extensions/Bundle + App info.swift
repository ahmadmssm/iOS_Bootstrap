//
//  Bundle + App name.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 11/12/18.
//

extension Bundle {
    
    public func appName() -> String {
        guard let dictionary = Bundle.main.infoDictionary else { return "" }
        if let version : String = dictionary["CFBundleName"] as? String { return version }
        else { return "" }
    }
    
    public func appId() -> String {
        return Bundle.main.bundleIdentifier!
    }

    public var versionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    public var buildNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
    
    public var bundleName: String? {
        return infoDictionary?["CFBundleName"] as? String
    }
    
}
