//
//  OtherModules.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 12/14/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import MapKit
import Resolver

extension Resolver {
    static func otherModules() {
        register { Dialogs() }
        register { CLLocationManager() }
        register { LocationManager() }
        register { LanguageManager() }
        register { Navigator() }.scope(application)
        register { SVGImageLoader() }.scope(application)
    }
}
