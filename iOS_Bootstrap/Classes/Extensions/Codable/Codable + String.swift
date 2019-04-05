//
//  Codable + String.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 9/25/18.
// Ref : https://stackoverflow.com/questions/29599005/how-to-serialize-or-convert-swift-objects-to-json
//

public extension Encodable {
    func toStringForm() -> String {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let data = try! encoder.encode(self)
        return String(data: data, encoding: .utf8)!
    }
}
