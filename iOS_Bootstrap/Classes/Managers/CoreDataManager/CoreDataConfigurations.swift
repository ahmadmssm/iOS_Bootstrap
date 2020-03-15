//
//  CoreDataConfigurations.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 12/15/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import CoreData

@available(iOS 10.0, *)
final class CoreDataConfigurations {
    
    static var persistentContainer: NSPersistentContainer = {
        return getPersistentContainer(withName: DefaultConfigurations.coreDataModelName!)
    }()
    
    static func getPersistentContainer(withName name: String) -> NSPersistentContainer {
        let container = NSPersistentContainer(name: name)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error {
                fatalError("Unresolved error, \((error as NSError).userInfo)")
            }
        })
        return container
    }
}
