//
//  Refresh Token.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 1/16/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

extension AppDelegate: AppDelegateService {
    // Refresh token callbacks
    func didFailedToRefreshToken() {}
    func tokenDidRefreshed(response: String) {
        Log.debug("Refresh token response : " + response)
    }
}
