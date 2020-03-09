//
//  MultiLanguageManager.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 8/3/18.
//

open class MultiLanguageManager {
    
    private  let defaults : UserDefaultsManager!
    // Note : This key is apple specific and not any key can be used
    private final var appleLanguagesKey : String!
    
    public init() {
        defaults = UserDefaultsManager()
        appleLanguagesKey = "AppleLanguages"
        //
//        #if swift(>=3.0)
//            // 3.0 < your swift version < 4.0
//            // Use this key instead
//            appleLanguagesKey = "AppleLanguages"
//        #endif
//        #if swift(>=4.0)
//            appleLanguagesKey = "i18n_language"
//        #endif
    }
    
    public func getCurrentAppLanguage() -> String {
        let langsArrary : NSArray = defaults.getArrayWithKey(key: appleLanguagesKey) as NSArray
        let languageStr : String = langsArrary.firstObject as! String
        return languageStr
    }
    
//    public func getCurrentAppLanguage() -> String {
//        return Locale.preferredLanguages[0]
//    }
    
    public func getDeviceLanguage() -> String {
        let locale = NSLocale.current.languageCode
        return locale!
    }
    
    /**
     Restart App is required to take effec, Thits is the default behaviour.
     Use tis this function or - switchAppLanguageInstantly - to change the app default language.
     */
    public func setAppDefaultLanguage<T: RawRepresentable>(language: T) where T.RawValue == String {
        //
        setAppLanguage(languageKey: language.rawValue)
    }
    
    /**
     This function uses swizzling to update the app language without the need to restart the app.
      Use tis this function or - setAppDefaultLanguage - to change the app default language.
     */
    public func switchAppLanguageInstantly<T: RawRepresentable>(language: T) where T.RawValue == String {
        //
        // - To do : Auto refresh current view controller -
        //
        localizationSwizzler()
        setAppLanguage(languageKey: language.rawValue)
    }
    
    private func setAppLanguage(languageKey: String) {
        let langsArray = [languageKey, getCurrentAppLanguage()]
        let appleLanguage : String  = defaults.getArrayWithKey(key: appleLanguagesKey)[0]
        if (!languageKey.isEqual(appleLanguage)) {
            defaults.setArrayWithKey(value: langsArray, key: appleLanguagesKey)
        }
        //
        if ((languageKey.range(of: "ar")) != nil) {
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
        }
        else {
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
        }
    }
    
    private func localizationSwizzler() {
        // Swizzle localization functions for app
        swizzleOriginalLocalizationMethod(className: Bundle.self, originalSelector: #selector(Bundle.localizedString(forKey:value:table:)), newSelector: #selector(Bundle.customLocalizedString(for:value:table:)))
        // Swizzle navigationbar direction variable.
        swizzleOriginalLocalizationMethod(className: UIApplication.self, originalSelector: #selector(getter: UIApplication.userInterfaceLayoutDirection), newSelector: #selector(getter: UIApplication.customisedUserInterfaceDirection))
    }
}
