//
//  LocalizationHelpers.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 8/4/18.
//


func swizzleOriginalLocalizationMethod(className : AnyClass, originalSelector : Selector, newSelector : Selector) {
    //
    let originalMethod = class_getInstanceMethod(className, originalSelector)
    let newMethod = class_getInstanceMethod(className, newSelector)
    
    if class_addMethod(className, originalSelector, method_getImplementation(newMethod!), method_getTypeEncoding(newMethod!)) {
        
        class_replaceMethod(className, newSelector, method_getImplementation(originalMethod!), method_getTypeEncoding(originalMethod!))
    }
    else {
        method_exchangeImplementations(originalMethod!, newMethod!)
    }
    
}

extension Bundle {
    @objc func customLocalizedString(for key: String, value: String?, table tableName: String?) -> String {
        //
        let currentLanguage = Locale.preferredLanguages[0]
        let fileExtension : String = "lproj"
        
        var bundle : Bundle!
        if let path = Bundle.main.path(forResource: currentLanguage, ofType: fileExtension) {
            bundle = Bundle(path: path)
        }
        else {
            let path = Bundle.main.path(forResource: "Base", ofType: fileExtension)
            bundle = Bundle(path: path!)
        }
        //
        return bundle.customLocalizedString(for: key, value: value, table: tableName)

    }
}

extension UIApplication {
    @objc var customisedUserInterfaceDirection : UIUserInterfaceLayoutDirection {
        get {
            // Default app direction
            var direction : UIUserInterfaceLayoutDirection = .leftToRight
            //
            let appLang = Locale.preferredLanguages[0]
            if ((appLang.range(of: Languages.Arabic.rawValue)) != nil) {
                direction = .rightToLeft
            }
            //
            return direction
        }
    }
}
