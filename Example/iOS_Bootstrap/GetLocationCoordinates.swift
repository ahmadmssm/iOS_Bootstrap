//
//  GetLocationCoordinates.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 8/9/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

class GetLocationCoordinates: AppAPI<Coordinates> {
    
    private let ip: String

    override var baseURL: URL { return "http://api.ipstack.com".toURL() }
    override var route: Route { return .get("/" + ip) }
    override var parameters: Parameters? {
        return URLEncoding() => ["access_key" : Constants.ipstackAuthKey]
    }
    
    init(ip: String) {
        self.ip = ip
    }
}
