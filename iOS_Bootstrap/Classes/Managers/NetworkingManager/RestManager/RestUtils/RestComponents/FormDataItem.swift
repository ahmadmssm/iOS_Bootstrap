//
//  FormDataItem.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 3/20/20.
//

import Foundation

public struct FormDataItem {

    let data: Data
    let name: String
    let fileName: String?
    let mimeType: String?
    
    init(data: Data, name: String, fileName: String?, mimeType: String?) {
        self.data = data
        self.name = name
        self.fileName = fileName
        self.mimeType = mimeType
    }
}
