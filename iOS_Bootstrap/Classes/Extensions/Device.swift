//
//  Device.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 3/30/19.
//

public extension UIDevice {
    static var isSimulator: Bool {
        return ProcessInfo.processInfo.environment["SIMULATOR_DEVICE_NAME"] != nil
    }
}
