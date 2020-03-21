//
//  SessionService.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 3/17/20.
//

public protocol SessionService {
    func hasValidSession() -> Bool
    func shoudRetryWithAuthentication() -> Bool
    func getAccessToken() -> String
    func save(accessToken: String)
    func extractTokenFrom(data: Data) -> String
    func clearSession()
}
