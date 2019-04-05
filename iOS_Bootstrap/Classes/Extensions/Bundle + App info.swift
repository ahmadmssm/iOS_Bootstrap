//
//  Bundle + App name.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 11/12/18.
//

public extension Bundle {
    func appName() -> String {
        guard let dictionary = Bundle.main.infoDictionary else { return "" }
        if let version : String = dictionary["CFBundleName"] as? String { return version }
        else { return "" }
    }
    
    func appId() -> String {
        return Bundle.main.bundleIdentifier!
    }

    var versionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    var buildNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
    
    var bundleName: String? {
        return infoDictionary?["CFBundleName"] as? String
    }
}
