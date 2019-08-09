//
//  RefreshTokenAPI.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 8/9/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import iOS_Bootstrap
import RxSwift

class RefreshTokenAPI: AppAPI<String> {
    
    override var route: Route { return .get("/refrehs/") }
    override var parameters: Parameters? {
        return JSONEncoding() => ["old_token" : "oldToken"]
    }
}

extension RefreshTokenAPI {
    static func request() -> Single<Response> {
        return RefreshTokenAPI().buildFlatRequestWithoutLoader()
    }
}
