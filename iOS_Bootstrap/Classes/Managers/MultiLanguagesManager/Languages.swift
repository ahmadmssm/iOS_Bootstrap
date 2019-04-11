//
//  Languages.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 8/3/18.
//

public enum Languages: String, CaseIterable {
    case German = "de"
    case French = "fr"
    case Italian = "it"
    case Spanish = "es"
    case Czech = "cs"
    case English = "en"
    case Arabic = "ar"
    case Arabic_Egypt = "ar-EG"
    
    
    public var description: String { return self.rawValue }
}
