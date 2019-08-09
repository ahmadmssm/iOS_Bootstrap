//
//  AppAPI.swift
//  iOS_Bootstrap_BaseProject
//
//  Created by Ahmad Mahmoud on 6/24/19.
//  Copyright © 2019 Ahmad Mahmoud. All rights reserved.
//

import iOS_Bootstrap
import RxSwift

class AppAPI<MappableType>: BaseAPI,
                            Requestable,
                            CachingPolicyService where MappableType: Codable {

    override var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }
    
    override var headers: [String: String]? { return nil }

    override var route: Route { return .get("") }

    var cachePolicy: URLRequest.CachePolicy {
        return .useProtocolCachePolicy
    }
}
