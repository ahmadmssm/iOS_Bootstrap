//
//  SessionManager.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 11/22/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

public class BaseSessionManager {
    
    private let userDefaults : UserDefaultsManager = BaseUser.userDefaults
    
    func getUserDefaults() -> UserDefaultsManager { return userDefaults }
    
}

public final class SessionManager : BaseSessionManager {
    
    private let sessionKey: String = "com.iOS_Bootstrap.Session"
    private var hasValidSessionKey : String = "com.iOS_Bootstrap.HasValidSessionKey"
    
    public final func saveSession<T: BaseSession>(session : T) {
        getUserDefaults().setObjectWithKey(value: session, key: sessionKey)
        getUserDefaults().setBooleanWithKey(value: true, key: hasValidSessionKey)
    }
    
    public final func getSavedSession<T: BaseSession>(session : T.Type) -> T? {
        return getUserDefaults().getObjectWithKey(object: session, key: sessionKey)

    }
    
    public final func hasValidSession() -> Bool {
        return getUserDefaults().getBooleanWithKey(key: hasValidSessionKey)
    }
    
    public final func clearSession() {
        getUserDefaults().deleteSavedValueWithKey(key: sessionKey)
        getUserDefaults().setBooleanWithKey(value: false, key: hasValidSessionKey)
    }
    
}
