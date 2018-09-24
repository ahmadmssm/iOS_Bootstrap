//
//  Codable + dictionary.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 7/24/18.
//  Ref : https://stackoverflow.com/questions/45209743/how-can-i-use-swift-s-codable-to-encode-into-a-dictionary
//

extension Encodable {
    public func toDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            throw NSError()
        }
        return dictionary
    }
    
    public var dictionaryDescription : [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
}
