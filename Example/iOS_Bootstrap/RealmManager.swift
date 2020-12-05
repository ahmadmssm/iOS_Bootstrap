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
    
    private let config = Realm.Configuration(
        // Set the new schema version. This must be greater than the previously used
        // version (if you've never set a schema version before, the version is 0).
        schemaVersion: UInt64(Constants.realmDatabaseVersion)
    )
    
    required init() {
        Realm.Configuration.defaultConfiguration = config   
        realm = try! Realm()
    }
    
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
                    self.realm.add(record, update: .modified)
                    completable(.completed)
                }
            }
            catch let error { completable(.error(error)) }
            return Disposables.create()
        }
    }
    
    func updateRecord(with predicate: NSPredicate) -> Completable {
        return Completable.create { completable in
            do {
                try self.realm.write {
                    if let recordToUpdate = self.realm.objects(T.self).filter(predicate).first {
                        self.realm.add(recordToUpdate, update: .modified)
                        completable(.completed)
                    }
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
                    self.realm.add(records, update: .modified)
                    completable(.completed)
                }
            }
            catch let error { completable(.error(error)) }
            return Disposables.create()
        }
    }
    
    func updateRecords(with predicate: NSPredicate) -> Completable {
        return Completable.create { completable in
            do {
                try self.realm.write {
                    if let recordsToUpdate = self.realm.objects(T.self).filter(predicate).first {
                        self.realm.add(recordsToUpdate, update: .modified)
                        completable(.completed)
                    }
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
    
    func deleteRecord(with predicate: NSPredicate) -> Completable {
        return Completable.create { completable in
            do {
                try self.realm.write {
                    if let recordToDelete = self.realm.objects(T.self).filter(predicate).first {
                        self.realm.delete(recordToDelete)
                        completable(.completed)
                    }
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
    
    func deleteRecords(with predicate: NSPredicate) -> Completable {
        return Completable.create { completable in
            do {
                try self.realm.write {
                    if let recordToDelete = self.realm.objects(T.self).filter(predicate).first {
                        self.realm.delete(recordToDelete)
                        completable(.completed)
                    }
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
    
    func getRecordWith(primaryKey: String) -> Single<T> {
        return Single.create { single in
            do {
                if let result = self.realm.object(ofType: T.self, forPrimaryKey: primaryKey) {
                    single(.success(result))
                }
                else {
                    let error = NSError(domain: "", code: 1009, userInfo:[ NSLocalizedDescriptionKey: "Record not found in database !"])
                    single(.failure(error))
                }
            }
            return Disposables.create()
        }
    }
    
    func getRecordWith(with predicate: NSPredicate) -> Single<T> {
        return Single.create { single in
            do {
                try self.realm.write {
                    if let result = self.realm.objects(T.self).filter(predicate).first {
                        single(.success(result))
                    }
                }
            }
            catch let error { single(.failure(error)) }
            return Disposables.create()
        }
    }
    
    func getRecordsFilteredBy(filter: String) -> Single<[T]> {
        return Single.create { single in
            do {
                let results = self.realm.objects(T.self).filter(filter)
                // single(.success(results.toArray()))
            }
            return Disposables.create()
        }
    }
    
    func getRecordsFilteredBy(with predicate: NSPredicate) -> Single<T> {
        return Single.create { single in
            do {
                try self.realm.write {
                    if let results = self.realm.objects(T.self).filter(predicate).first {
                        single(.success(results))
                    }
                }
            }
            catch let error { single(.failure(error)) }
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
    
    func getAllRecords() -> Single<[T]> {
        return Single.create { single in
            do {
                let results = self.realm.objects(T.self)
               // single(.success(results.toArray()))
            }
            return Disposables.create()
        }
    }
    
    func getRecordAtIndex(index: Int) -> Single<T> {
        return getAllRecords().flatMap { selector -> Single<T> in
            return Single.just(selector[index])
        }
    }
}
