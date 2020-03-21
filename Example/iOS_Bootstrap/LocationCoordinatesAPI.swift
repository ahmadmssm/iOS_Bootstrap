//
//  LocationCoordinatesAPI.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 8/9/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

// "http://api.ipstack.com"
class LocationCoordinatesAPI: AppAPI {

    private let ip: String

    var route: Route { return .get("/" + ip) }
    var parameters: Parameters? { return URLEncoding() => ["access_key" : Constants.ipstackAuthKey] }

    init(ip: String) {
        self.ip = ip
    }
}

