//
//  SessionProtocol.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 7/26/18.
//

@objc public protocol SessionProtocol {
    
    @objc optional func doLogOut()
    func refreshToken()

}

