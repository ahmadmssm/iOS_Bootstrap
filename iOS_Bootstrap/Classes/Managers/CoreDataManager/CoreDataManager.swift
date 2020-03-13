//
//  CoreDataManager.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 12/15/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import CoreData
import RxSwift

@available(iOS 10.0, *)
open class CoreDataManager<T: NSManagedObject> {
    
    public let context: NSManagedObjectContext!
    
    public init() {
        context = CoreDataConfigurations.persistentContainer.viewContext
    }
    
    public init(withName name: String) {
        context = CoreDataConfigurations.getPersistentContainer(withName: name).viewContext
    }
    
    public func insertRecord(record: T) { context.insert(record) }

    public func insertRecordCompletable(record: T) -> Completable {
        return Completable.create { [weak self] completable in
            self?.insertRecord(record: record)
            completable(.completed)
            return Disposables.create {}
        }
    }

    public func insertRecords(records : [T]) {
        records.forEach { record in insertRecord(record: record) }
    }
    
    public func insertRecordsCompletable(records : [T]) -> Completable {
        return Completable.create { [weak self] completable in
            self?.insertRecords(records: records)
            completable(.completed)
            return Disposables.create {}
        }
    }
    
    open func fetchAll() -> Observable<[T]> {
        return Observable.create { observer in
            var items : [T] = []
            do {
                let arrayOfItems = try self.context.fetch(self.getFetchReuest()) as! [T]
                arrayOfItems.forEach { item in items.append(item) }
                observer.onNext(items)
                observer.on(.completed)
            }
            catch let error { observer.onError(error) }
            return Disposables.create()
        }
    }
   
    public func getRecordsPerPage(perPage: Int, offset: Int, completion: @escaping completionHandler<Bool>) -> [T] {
        return []
    }
    
//    public func updateRecord(record: String, completion: @escaping completionHandler<Bool>) {
//
//    }
//
//    public func deleteRecord(record: String, completion: @escaping completionHandler<Bool>) {
//
//    }
    
    public func deleteAllRecords() -> Completable {
        return self.fetchAll()
            .flatMap({ records -> Completable in
            do {
                for record in records {
                    let managedObjectData: NSManagedObject = record as NSManagedObject
                    self.context.delete(managedObjectData)
                }
                try self.context.save()
                return Completable.empty()
            }
            catch { return Completable.error(error) }
        }).asCompletable()
    }
    
    public final func getFetchReuest() -> NSFetchRequest<NSFetchRequestResult> {
        let entityName: String = T.classForCoder().description()
        return NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
    }
    
    public final func getDeleteRequest() -> NSBatchDeleteRequest {
        return NSBatchDeleteRequest(fetchRequest: getFetchReuest())
    }
    
}
