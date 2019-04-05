//
//  FormDataBuildere.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 4/5/19.
//

import UIKit

open class FormDataBuilder {
    
    private var multipartData = [MultipartFormData]()
    
    open func append(image: UIImage) -> FormDataBuilder {
        multipartData.append(Moya.MultipartFormData(provider: MultipartFormData.FormDataProvider.data(image.png!), name: "image", fileName: "image.png", mimeType: "image/png"))
        return self
    }
    
    open func append(image: UIImage, with name: String) -> FormDataBuilder {
        multipartData.append(Moya.MultipartFormData(provider: MultipartFormData.FormDataProvider.data(image.png!), name: name, fileName: name + ".png", mimeType: "image/png"))
        return self
    }
    
    open func append(dictionary: [String: String]) -> FormDataBuilder {
        for (key, value) in dictionary {
            let formData = MultipartFormData(provider: .data(value.data(using: .utf8)!), name: key)
            multipartData.append(formData)
        }
        return self
    }
    
    open func append(string: String, with name: String) -> FormDataBuilder {
        let formData = MultipartFormData(provider: .data(string.data(using: .utf8)!), name: name)
        multipartData.append(formData)
        return self
    }
    
    open func append(double: Double, with name: String) -> FormDataBuilder {
        let formData = MultipartFormData(provider: .data(double.description.data(using: .utf8)!), name: name)
        multipartData.append(formData)
        return self
    }
    
    open func append(integer: Int, with name: String) -> FormDataBuilder {
        let formData = MultipartFormData(provider: .data(integer.description.data(using: .utf8)!), name: name)
        multipartData.append(formData)
        return self
    }
    
    open func append(data: Data, with name: String) -> FormDataBuilder {
        let formData = MultipartFormData(provider: .data(data), name: name)
        multipartData.append(formData)
        return self
    }
    
    
    open func getFormData() -> [MultipartFormData] { return multipartData }
    
}
