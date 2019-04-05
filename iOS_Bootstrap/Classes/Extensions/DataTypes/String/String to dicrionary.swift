//
//  String.swift
//  PassApp
//
//  Created by Ahmad Mahmoud on 4/1/18.
//  Copyright © 2018 Robustastudio. All rights reserved.
//

public extension String {
    func toDictionary() -> [String: Any] {
//        if let data = self.data(using: .utf8) {
//            do {
//                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
//            }
//            catch {
//                print(error.localizedDescription)
//            }
//        }
//        return nil
        return try! JSONSerializer.toDictionary(self) as! [String : Any]
    }
}
