//
//  SessionManager.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 3/20/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

class SessionManager: SessionService {
    
    func hasValidSession() -> Bool {
        return true
    }
    
    func shoudRetryWithAuthentication() -> Bool {
        return true
    }
    
    func getAccessToken() -> String {
        return ""
    }
    
    func save(accessToken: String) {
        // Log.debug("Refresh token response : " + response)
    }
    
    func extractTokenFrom(data: Data) -> String {
        return ""
    }
    
    func clearSession() {
        
    }
}

