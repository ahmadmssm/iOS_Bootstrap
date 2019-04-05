//
//  String + To codable.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 3/14/19.
//

import Foundation

public extension String {
    func toModel<T: Decodable>(model: T.Type) -> T? {
        guard let data = self.data(using: .utf8) else {
            fatalError("Couldn't get data from json")
        }
        do {
            let response = try JSONDecoder().decode(model.self, from: data)
            return response
        } catch { print(error) }
        return nil
    }
    func toModelWithCamelCaseKeys<T: Decodable>(model: T.Type) -> T? {
        guard let data = self.data(using: .utf8) else {
            fatalError("Couldn't get data from json")
        }
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let response = try decoder.decode(model.self, from: data)
            return response
        } catch { print(error) }
        return nil
    }
}
