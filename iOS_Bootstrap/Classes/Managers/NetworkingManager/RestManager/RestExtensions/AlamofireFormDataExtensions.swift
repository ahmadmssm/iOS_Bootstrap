//
//  AlamofireFormDataExtensions.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 3/21/20.
//

import Alamofire

public extension MultipartFormData {
    func from(dictionary: [String : Any]) {
        for (key, value) in dictionary {
            if let stringValue = value as? String {
                self.append(stringValue.data(using: .utf8)!, withName: key)
            }
            if let intValue = value as? Int {
                self.append("\(intValue)".data(using: .utf8)!, withName: key)
            }
            if let doubleValue = value as? Double {
                self.append("\(doubleValue)".data(using: .utf8)!, withName: key)
            }
            if let floatValue = value as? Float {
                self.append("\(floatValue)".data(using: .utf8)!, withName: key)
            }
            if let booleanValue = value as? Bool {
                self.append(String(booleanValue).data(using: .utf8)!, withName: key)
            }
            if let file = value as? FormDataItem {
                self.append(file.data,
                            withName: file.name,
                            fileName: file.fileName,
                            mimeType: file.mimeType)
            }
            if let arrayValue = value as? NSArray {
                arrayValue.forEach({ element in
                    let objectKey = key + "[]"
                    if let string = element as? String {
                        self.append(string.data(using: .utf8)!, withName: objectKey)
                    }
                    else if let num = element as? Int {
                        self.append("\(num)".data(using: .utf8)!, withName: objectKey)
                    }
                    else if let num = element as? Double {
                        self.append("\(num)".data(using: .utf8)!, withName: objectKey)
                    }
                    else if let num = element as? Float {
                        self.append("\(num)".data(using: .utf8)!, withName: objectKey)
                    }
                    else if let booleanValue = value as? Bool {
                        self.append(String(booleanValue).data(using: .utf8)!, withName: key)
                    }
                    else if let file = value as? FormDataItem {
                        self.append(file.data,
                                    withName: file.name,
                                    fileName: file.fileName,
                                    mimeType: file.mimeType)
                    }
                })
            }
        }
    }
}

