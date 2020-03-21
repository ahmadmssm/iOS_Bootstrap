//
//  AppErrorModel.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 8/9/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

class AppErrorModel: Codable {
    
    private(set) var statusCode : Int?
    private(set) var description : String?
    private(set) var response : String?

    enum CodingKeys: String, CodingKey {
        case statusCode
        case description
        case response
    }
    
    public required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        statusCode = try values.decodeIfPresent(Int.self, forKey: .statusCode)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        response = try values.decodeIfPresent(String.self, forKey: .response)
    }
    
    func setStatusCode(statusCode: Int) -> AppErrorModel {
        self.statusCode = statusCode
        return self
    }
    
    func setDescription(description: String) -> AppErrorModel {
        self.description = description
        return self
    }
    
    func setResponse(response: String) -> AppErrorModel {
        self.response = response
        return self
    }
    
    func toString() -> String {
        return self.toJsonString()
    }
}

