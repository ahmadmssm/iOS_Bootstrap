//
//  Results + Pagination.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 12/22/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import RealmSwift

extension Results {
    func getRecordsPerPage <T: Object> (perPage: Int, page: Int) -> Array<T> {
        // Per page
        var limit = 0
        // Page
        var offset = 0
        // Results list
        var records: Array<T>! = Array<T>()
        //check indexes
        if (offset <= perPage && perPage < self.count - 1) { offset = perPage }
        if (page > self.count) { limit = self.count }
        else{ limit = page }
        //do slicing
        for index in (offset ..< limit) {
            let record = self[index] as! T
            records.append(record)
        }
        return records
    }
}

