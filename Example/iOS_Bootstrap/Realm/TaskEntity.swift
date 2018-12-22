//
//  TaskEntity.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 12/21/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import RealmSwift

class TaskEntity: Object {
    @objc dynamic var name = ""
    @objc dynamic var notes = ""
    @objc dynamic var isCompleted = false
}
