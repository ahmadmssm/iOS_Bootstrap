//
//  PresenterFunctions.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 10/31/18.
//

public protocol PresenterFunctions : SessionService {
    func viewControllerDidLoaded()
    func viewControllerDidFinishedSettingUpUI()
    func viewControllerWillRefresh()
    func viewControllerWillDisappear()
    func logOut()
}

