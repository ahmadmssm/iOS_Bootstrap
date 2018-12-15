//
//  CountryEntity.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 12/15/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import CoreData

@objc(CountryEntity)
final class CountryEntity: NSManagedObject {
    @NSManaged var name: String?
    @NSManaged var capital: String?
    @NSManaged var continental: String?
    @NSManaged var timeZone: String?
    @NSManaged var flagURL: String?
}

extension CountryEntity {
    @nonobjc class func fetch() -> NSFetchRequest<CountryEntity> {
        return NSFetchRequest<CountryEntity>(entityName: "CountryEntity")
    }
   
    @nonobjc class func delete() -> NSBatchDeleteRequest {
        return NSBatchDeleteRequest(fetchRequest: fetch() as! NSFetchRequest<NSFetchRequestResult>)
    }
    
}

