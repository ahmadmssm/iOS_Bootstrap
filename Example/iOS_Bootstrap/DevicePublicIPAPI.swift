//
//  DevicePublicIPAPI.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 8/9/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

class DevicePublicIPAPI: AppAPI {
    var route: Route { return .get(Endpoints.devicePublicIP) }
}

