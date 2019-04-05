//
//  String to Codable object.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 9/13/18.
//

public extension String {
    func toObjectOfType<T : Codable>(Object : T.Type) -> T {
        let data = self.data(using: .utf8)!
        var obj : T? = nil
        do { obj = try JSONDecoder().decode(Object.self, from: data) }
        catch { print(error) }
        return obj!
    }
}
