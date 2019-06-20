//
//  BaseStubbedConnectorConfigurations.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 6/20/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

open class BaseStubbedConnectorConfigurations<T : GenericAPIs>:
                                                BaseStubedAPIsConnector<T> {
    public required override init() { super.init() }
}
