//
//  CachingPolicyService.swift
//  GitHubReposListingSample
//
//  Created by Ahmad Mahmoud on 12/1/18.
//  Copyright © 2018 Ahmad Mahmoud. All rights reserved.
//

public protocol CachingPolicyService {
    var cachePolicy: URLRequest.CachePolicy { get }
}
