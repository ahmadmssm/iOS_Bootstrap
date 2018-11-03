//
//  Constants.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 8/2/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

struct Constants : BaseConstants {
    
    static let getEnvironmentVariables: Environment = {
        return getEnvironment(Environment.self)
    }()
    
    static let tmdbAuthKey = "22be16bc2f5eecf293aea95be4a83105"
    
}
