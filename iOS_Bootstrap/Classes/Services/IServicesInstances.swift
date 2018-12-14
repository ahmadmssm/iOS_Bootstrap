//
//  IServicesInstances.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 9/28/18.
//

public protocol IServicesInstances {
    var servicesInstaces : ServicesInstances { get }
}

public extension IServicesInstances {
    var servicesInstaces : ServicesInstances { return ServicesInstances () }
}
