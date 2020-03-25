//
//  PresentationLayerLifeCycle.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 6/22/19.
//

public protocol PresentationLayerLifeCycle: InjectableView {
    func viewControllerDidLoad()
    func viewControllerDidFinishSettingUpUI()
    func viewControllerWillRefresh()
    func viewControllerWillDisappear()
    func logOut()
}
