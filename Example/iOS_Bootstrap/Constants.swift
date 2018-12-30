//
//  Constants.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 8/2/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

struct Constants {
    static let environment: Environment = { return Environment.getEnvironmentVariables() }()
    static let tmdbAuthKey: String = "22be16bc2f5eecf293aea95be4a83105"
    static let ipstackAuthKey: String = "45399d5079fd9249fc1f8c94ad33c200"
    static let openApiAuthKey: String = "c4ce55f864d8eb32d003dc283f6a8119"
    static let coreDataModelName: String = "DataBase"
    static let realmDatabaseVersion: Int = 2
    static let activeToDoEvent = "activeToDoEvent"
    static let doneToDoEvent = "doneToDoEvent"

}
