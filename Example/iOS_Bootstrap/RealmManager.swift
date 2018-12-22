//
//  RealmManag.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 12/21/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//
// Ref: https://github.com/realm/realm-cocoa/issues/2608

import RealmSwift
import RxSwift

class RealmManager<T: Object> {
    
    private let realm: Realm!
    
    required init() { realm = try! Realm() }
    
    final func getRealm() -> Realm { return realm }
    
    func insertRecord(record: T) -> Completable {
        return Completable.create { completable in
            do {
                try self.realm.write {
                    self.realm.add(record)
                    completable(.completed)
                }
            }
            catch let error { completable(.error(error)) }
            return Disposables.create()
        }
    }
    
    func insertRecords(records: [T]) -> Completable {
        return Completable.create { completable in
            do {
                try self.realm.write {
                    self.realm.add(records)
                    completable(.completed)
                }
            }
            catch let error { completable(.error(error)) }
            return Disposables.create()
        }
    }
    
    // If the record exists, Realm will update the object accordingly. Otherwise, Realm will insert the object into the database
    func updateRecord(record: T) -> Completable {
        return Completable.create { completable in
            do {
                try self.realm.write {
                    self.realm.add(record, update: true)
                    completable(.completed)
                }
            }
            catch let error { completable(.error(error)) }
            return Disposables.create()
        }
    }
    
    func updateRecords(records: [T]) -> Completable {
        return Completable.create { completable in
            do {
                try self.realm.write {
                    self.realm.add(records, update: true)
                    completable(.completed)
                }
            }
            catch let error { completable(.error(error)) }
            return Disposables.create()
        }
    }
    
    func deleteRecord(record: T) -> Completable {
        return Completable.create { completable in
            do {
                try self.realm.write {
                    self.realm.delete(record.self)
                    completable(.completed)
                }
            }
            catch let error { completable(.error(error)) }
            return Disposables.create()
        }
    }
    
    func deleteRecord(record: T.Type, primaryKey: String) -> Completable {
        return Completable.create { completable in
            do {
                try self.realm.write {
                    if let result = self.realm.object(ofType: record, forPrimaryKey: primaryKey) {
                        self.realm.delete(result)
                        completable(.completed)
                    }
                    else {
                        let error = NSError(domain: "", code: 1009, userInfo:[ NSLocalizedDescriptionKey: "Record not found in database !"])
                        completable(.error(error))
                    }
                }
            }
            catch let error { completable(.error(error)) }
            return Disposables.create()
        }
    }
    
    func deleteRecords(records: [T]) -> Completable {
        return Completable.create { completable in
            do {
                try self.realm.write {
                    self.realm.delete(records)
                    completable(.completed)
                }
            }
            catch let error { completable(.error(error)) }
            return Disposables.create()
        }
    }
    
    func deleteAllRecords(forObject: T.Type) -> Completable {
        return Completable.create { completable in
            do {
                try self.realm.write {
                    let result = self.realm.objects(forObject)
                    self.realm.delete(result)
                    completable(.completed)
                }
            }
            catch let error { completable(.error(error)) }
            return Disposables.create()
        }
    }
    
    func getRecordWith(primaryKey: String) -> Observable<T> {
        return Observable.create { observer in
            do {
                if let result = self.realm.object(ofType: T.self, forPrimaryKey: primaryKey) {
                    observer.onNext(result)
                }
                else {
                    let error = NSError(domain: "", code: 1009, userInfo:[ NSLocalizedDescriptionKey: "Record not found in database !"])
                    observer.onError(error)
                }
            }
            observer.on(.completed)
            return Disposables.create()
        }
    }
    
    func getRecordsFilteredBy(filter: String) -> Observable<[T]> {
        return Observable.create { observer in
            do {
                let results = self.realm.objects(T.self).filter(filter)
                observer.onNext(results.toArray())
            }
            observer.on(.completed)
            return Disposables.create()
        }
    }
    
    func getRecordsPerPage(perPage: Int, page: Int, filterBy: String) -> Observable<[T]> {
        return Observable.create { observer in
            do {
                let results =
                    self.realm
                        .objects(T.self)
                        .filter(filterBy)
                        .getRecordsPerPage(perPage: perPage, page: page)
                observer.onNext(results as! [T])
            }
            observer.on(.completed)
            return Disposables.create()
        }
    }
    
    func getRecordsPerPage(perPage: Int, page: Int) -> Observable<[T]> {
        return Observable.create { observer in
            do {
                let results =
                    self.realm
                        .objects(T.self)
                        .getRecordsPerPage(perPage: perPage, page: page)
                observer.onNext(results as! [T])
            }
            observer.on(.completed)
            return Disposables.create()
        }
    }
    
    func getAllRecords() -> Observable<[T]> {
        return Observable.create { observer in
            do {
                let results = self.realm.objects(T.self)
                observer.onNext(results.toArray())
            }
            observer.on(.completed)
            return Disposables.create()
        }
    }
    
}
