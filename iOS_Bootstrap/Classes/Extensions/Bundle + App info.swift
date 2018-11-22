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

}
