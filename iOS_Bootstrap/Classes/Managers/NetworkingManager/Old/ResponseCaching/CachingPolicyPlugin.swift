////
////  CachingPolicyPlugin.swift
////  GitHubReposListingSample
////
////  Created by Ahmad Mahmoud on 12/1/18.
////  Copyright © 2018 Ahmad Mahmoud. All rights reserved.
////
//
//open class CachingPolicyPlugin: PluginType {
//    
//    public init() {}
//    
//    public func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
//        if let cachePolicyGettable = target as? CachingPolicyService {
//            var mutableRequest = request
//            mutableRequest.cachePolicy = cachePolicyGettable.cachePolicy
//            return mutableRequest
//        }
//        return request
//    }
//}
//
