//
//  FormDataBuildere.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 4/5/19.
//

import UIKit

open class FormDataBuilder {
    
    public var multipartData = [MultipartFormData]()
    
    public init() {}
    
    open func append(image: UIImage) -> FormDataBuilder {
        multipartData.append(Moya.MultipartFormData(provider: MultipartFormData.FormDataProvider.data(image.png!), name: "image", fileName: "image.png", mimeType: "image/png"))
        return self
    }
    
    open func append(image: UIImage, with key: String) -> FormDataBuilder {
        multipartData.append(Moya.MultipartFormData(provider: MultipartFormData.FormDataProvider.data(image.png!), name: key, fileName: key + ".png", mimeType: "image/png"))
        return self
    }
    
    open func append(dictionary: [String: String]) -> FormDataBuilder {
        for (key, value) in dictionary {
            let formData = MultipartFormData(provider: .data(value.data(using: .utf8)!), name: key)
            multipartData.append(formData)
        }
        return self
    }
    
    open func append(string: String, with key: String) -> FormDataBuilder {
        let formData = MultipartFormData(provider: .data(string.data(using: .utf8)!), name: key)
        multipartData.append(formData)
        return self
    }
    
    open func append(character: Character, with name: String) -> FormDataBuilder {
        _ = append(string: String(character), with: name)
        return self
    }
    
    open func append(double: Double, with key: String) -> FormDataBuilder {
        let formData = MultipartFormData(provider: .data(double.description.data(using: .utf8)!), name: key)
        multipartData.append(formData)
        return self
    }
    
    open func append(float: Float, with key: String) -> FormDataBuilder {
        let formData = MultipartFormData(provider: .data(float.description.data(using: .utf8)!), name: key)
        multipartData.append(formData)
        return self
    }
    
    open func append(integer: Int, with key: String) -> FormDataBuilder {
        let formData = MultipartFormData(provider: .data(integer.description.data(using: .utf8)!), name: key)
        multipartData.append(formData)
        return self
    }
    
    open func append(boolean: Bool, with key: String) -> FormDataBuilder {
        let booleanToInt: Int = boolean ? 1 : 0
        _ = self.append(integer: booleanToInt, with: key)
        return self
    }
    
    open func append(data: Data, with key: String) -> FormDataBuilder {
        let formData = MultipartFormData(provider: .data(data), name: key)
        multipartData.append(formData)
        return self
    }
    
    // MARK: Append Multipart
    open func appendPart(string: String,
                         partIndex: Int,
                         parentKey: String,
                         with key: String) -> FormDataBuilder {
        let keyName = getCompositeMultiPartFullKeyName(keyName: parentKey, index: partIndex, subKeyName: key)
        _ = append(string: string, with: keyName)
        return self
    }
    
    open func appendPart(character: Character,
                         partIndex: Int,
                         parentKey: String,
                         with key: String) -> FormDataBuilder {
        let keyName = getCompositeMultiPartFullKeyName(keyName: parentKey, index: partIndex, subKeyName: key)
        _ = append(string: String(character), with: keyName)
        return self
    }
    
    open func appendPart(boolean: Bool,
                         partIndex: Int,
                         parentKey: String,
                         with key: String) -> FormDataBuilder {
        let keyName = getCompositeMultiPartFullKeyName(keyName: parentKey, index: partIndex, subKeyName: key)
        _ = append(boolean: boolean, with: keyName)
        return self
    }
    
    open func appendPart(int: Int,
                         partIndex: Int,
                         parentKey: String,
                         with key: String) -> FormDataBuilder {
        let keyName = getCompositeMultiPartFullKeyName(keyName: parentKey, index: partIndex, subKeyName: key)
        _ = append(integer: int, with: keyName)
        return self
    }
    
    open func appendPart(float: Float,
                         partIndex: Int,
                         parentKey: String,
                         with key: String) -> FormDataBuilder {
        let keyName = getCompositeMultiPartFullKeyName(keyName: parentKey, index: partIndex, subKeyName: key)
        _ = append(float: float, with: keyName)
        return self
    }
    
    open func appendPart(double: Double,
                         partIndex: Int,
                         parentKey: String,
                         with key: String) -> FormDataBuilder {
        let keyName = getCompositeMultiPartFullKeyName(keyName: parentKey, index: partIndex, subKeyName: key)
        _ = append(double: double, with: keyName)
        return self
    }
    
    open func appendPart(date: Data,
                         partIndex: Int,
                         parentKey: String,
                         with key: String) -> FormDataBuilder {
        let keyName = getCompositeMultiPartFullKeyName(keyName: parentKey, index: partIndex, subKeyName: key)
        _ = append(data: date, with: keyName)
        return self
    }
    
    open func appendPart(image: UIImage,
                         partIndex: Int,
                         parentKey: String,
                         with key: String) -> FormDataBuilder {
        let keyName = getCompositeMultiPartFullKeyName(keyName: parentKey, index: partIndex, subKeyName: key)
        _ = append(image: image, with: keyName)
        return self
    }
    
    // MARK: Append Multipart array
    open func append(intArray: [Int], with key: String) -> FormDataBuilder {
        for (index, value) in intArray.enumerated() {
            let keyName = getMultiPartFullKeyName(keyName: key, index: index)
            _ = append(integer: value, with: keyName)
        }
        return self
    }
    
    open func append(doubleArray: [Double], with key: String) -> FormDataBuilder {
        for (index, value) in doubleArray.enumerated() {
            let keyName = getMultiPartFullKeyName(keyName: key, index: index)
            _ = append(double: value, with: keyName)
        }
        return self
    }
    
    open func append(floatArray: [Float], with key: String) -> FormDataBuilder {
        for (index, value) in floatArray.enumerated() {
            let keyName = getMultiPartFullKeyName(keyName: key, index: index)
            _ = append(float: value, with: keyName)
        }
        return self
    }
    
    open func append(stringArray: [String], with key: String) -> FormDataBuilder {
        for (index, value) in stringArray.enumerated() {
            let keyName = getMultiPartFullKeyName(keyName: key, index: index)
            _ = append(string: value, with: keyName)
        }
        return self
    }
    
    open func append(booleanArray: [Bool], with key: String) -> FormDataBuilder {
        for (index, value) in booleanArray.enumerated() {
            let keyName = getMultiPartFullKeyName(keyName: key, index: index)
            _ = append(boolean: value, with: keyName)
        }
        return self
    }
    
    open func append(imagesArray: [UIImage], with key: String) -> FormDataBuilder {
        for (index, value) in imagesArray.enumerated() {
            let keyName = getMultiPartFullKeyName(keyName: key, index: index)
            _ = append(image: value, with: keyName)
        }
        return self
    }
    
    // Helper functions
    open func getKeyWithBrackets(keyName: String) -> String {
        return "[" + keyName + "]"
    }
    
    open func getMultiPartFullKeyName(keyName: String, index: Int) -> String {
        let keyPrefix: String = keyName + getKeyWithBrackets(keyName: String(index))
        return keyPrefix
    }
    
    open func getCompositeMultiPartFullKeyName(keyName: String,
                                               index: Int,
                                               subKeyName: String) -> String {
        let preFix: String = getMultiPartFullKeyName(keyName: keyName, index: index)
        return preFix + getKeyWithBrackets(keyName: subKeyName)
    }
    
    //
    open func getFormData() -> [MultipartFormData] { return multipartData }
}
