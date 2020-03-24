//
//  ToDoCellModell.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 12/21/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

struct ToDoCellModel: Codable, Equatable {
    
    var id: Int?
    var name: String?
    var createdAt: String?
    var isDone: Bool?
    // var tasks: [TaskEntity]?
    
    func getToDoCellEntity() -> ToDoListEntity {
        let toDoEntity = ToDoListEntity()
        toDoEntity.id = self.id!
        toDoEntity.name = self.name!
        if let date = DateTimeHelpers.getDateFromDateString(dateString: self.createdAt!) {
            toDoEntity.createdAt = date
        }
        toDoEntity.isDone = self.isDone!
        return toDoEntity
    }
}
