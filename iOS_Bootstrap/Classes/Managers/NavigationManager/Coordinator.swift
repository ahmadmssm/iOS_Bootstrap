//
//  Coordinator.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 7/10/18.
//

public protocol Coordinator {
    
    static var navigationController: UINavigationController? { get set }
    func startInitialView()
}

public extension Coordinator {
    public func startInitialView() {}
}

