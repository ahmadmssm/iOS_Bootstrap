//
//  LanguageManager.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 11/10/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

class LanguageManager {
    
    private let lngMngr : MultiLanguageManager!
    public typealias completionHandler = () -> ()


    init() { lngMngr = MultiLanguageManager() }
    
    func getAppLanguage() -> String {
        return lngMngr.getCurrentAppLanguage()
    }
    
    func switchAppLanguage(completion: completionHandler) {
        if (lngMngr.getCurrentAppLanguage() == Languages.Arabic.rawValue) {
            lngMngr.switchAppLanguageInstantly(language: Languages.English)
        }
        else {
            lngMngr.switchAppLanguageInstantly(language: Languages.Arabic)
        }
        completion()
    }
    
    func switchToArabicLanguage(completion: completionHandler) {
        lngMngr.switchAppLanguageInstantly(language: Languages.Arabic)
        completion()

    }
    
    func switchToEnglishLanguage(completion: completionHandler) {
        lngMngr.switchAppLanguageInstantly(language: Languages.English)
        completion()
    }
    
}
