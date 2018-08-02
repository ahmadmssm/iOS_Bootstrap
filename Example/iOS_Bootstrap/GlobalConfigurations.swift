//
//  GlobalConfigurations.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 8/2/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

struct GlobalConfigurations : Configurations {
    
    static let getEnvironmentVariables: Environment = {
        return getEnvironment(Environment.self)
    }()
  
}
