////
////  PushNotificationManager.swift
////  iOS_Bootstrap
////
////  Created by Ahmad Mahmoud on 6/19/18.
////
//
//import UserNotifications
//// import Firebase
//
//open class PushNotificationManager : UNUserNotificationCenterDelegate {
//    
//    public func application(_ application: UIApplication, didRegister notificationSettings: UIUserNotificationSettings) {
//        
//    }
//    
//    static func registerFirebaseMessaging(application: UIApplication) {
//        // Setup firebase
//        FIRApp.configure()
//        if #available(iOS 10.0, *) {
//            // For iOS 10 display notification (sent via APNS)
//            UNUserNotificationCenter.current().delegate = self
//            
//            let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
//            UNUserNotificationCenter.current().requestAuthorization(
//                options: authOptions,
//                completionHandler: {_, _ in })
//        } else {
//            let settings: UIUserNotificationSettings =
//                UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
//            application.registerUserNotificationSettings(settings)
//        }
//        
//        application.registerForRemoteNotifications()
//    }
//    
//    static func registerRemoteNotification (application: UIApplication) {
//        
//        if #available(iOS 10.0, *) {
//            let center  = UNUserNotificationCenter.current()
//            //  center.delegate = self
//            center.requestAuthorization(options: [.sound, .alert, .badge]) { (granted, error) in
//                if error == nil{
//                    application.registerForRemoteNotifications()
//                }
//            }
//        }
//        else {
//            UIApplication.shared.registerUserNotificationSettings(UIUserNotificationSettings(types: [.sound, .alert, .badge], categories: nil))
//            application.registerForRemoteNotifications()
//        }
//    }
//    
//    
//    
//}
//
