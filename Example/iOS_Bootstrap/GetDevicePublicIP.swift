//
//  GetDevicePublicIP.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 8/9/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import iOS_Bootstrap
import RxSwift

class GetDevicePublicIP: AppAPI<String> {
    override var baseURL: URL {
        return "https://api.ipify.org?format=json2".toURL()
    }
}

