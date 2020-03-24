//
//  ToDoMode.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 12/21/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

enum ToDoMode: CustomStringConvertible {
   
    case Active
    case Done
    
    var description: String {
        switch self {
        case .Active: return Constants.activeToDoEvent
        case .Done: return  Constants.doneToDoEvent
        }
    }
}
