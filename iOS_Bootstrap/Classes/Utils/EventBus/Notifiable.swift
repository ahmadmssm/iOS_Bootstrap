//
//  Notifiable.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 3/16/20.
//

extension NotificationCenter {
           
    static func post<T>(object: T) {
        let className = String(describing: object.self)
        let name = Notification.Name(className)
        let dict: [String : T] = [className : object]
        self.default.post(name: name, object: nil, userInfo: dict)
    }
    
    static func observe<T>(object: T.Type, _ closure: @escaping (Any) -> ()) {
        let className = String(describing: object.self)
        let name = Notification.Name(className)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.default.triggerActionHandler(_:closure:)),
                                               name: name, object: nil)
    }
    
    @objc private func triggerActionHandler(_ notification: NSNotification,
                                            closure: @escaping (Any) -> ()) {
        if let dict = notification.userInfo as NSDictionary? {
            let object = dict[notification.name] as Any
            closure(object)
        }
    }
}
