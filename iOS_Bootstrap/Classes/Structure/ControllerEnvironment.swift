//
//  ControllerEnvironment.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 6/22/19.
//

public protocol ControllerEnvironment: SessionService {
    func viewControllerDidLoaded()
    func viewControllerDidFinishedSettingUpUI()
    func viewControllerWillRefresh()
    func viewControllerWillDisappear()
    func logOut()
}
