//
//  SocialMediaManager.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 6/12/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//
//  Ref : https://github.com/smartnsoft/SNSSocial

//import UIKit
//import Social
//
//// import SNSSocial
//
//open class SocialMediaManager {
//
//    private let mContext : UIViewController?
//
//    public init(context : UIViewController) {
//        self.mContext = context
//    }
//
//    //////////////////////////////// Share to any /////////////////////////////////////////
//
//    public func share(itemToShare : AnyObject, excludedItems : [UIActivityType]?)   {
//        // set up activity view controller
//        let item = [ itemToShare ]
//        let activityViewController = UIActivityViewController(activityItems: item, applicationActivities: nil)
//        // So iPad won't crash
//        activityViewController.popoverPresentationController?.sourceView = mContext?.view
//        // exclude some activity types from the list (optional)
//        if (excludedItems != nil && !(excludedItems!.isEmpty)) {
//            activityViewController.excludedActivityTypes = excludedItems
//                // [ UIActivityType.airDrop, UIActivityType.postToFacebook ]
//        }
//        mContext?.present(activityViewController, animated: true, completion: nil)
//    }
//
//    //////////////////////////////// Facebook /////////////////////////////////////////
//    /**
//     *  Activates Facebook SDK and enables application to receive Facebook delegate events (must be called in the "applicationDidBecomeActive" method of your AppDelegate)
//     */
//    static func facebookAppecomeActive() {
//        SNSFacebook.activateApplication()
//    }
//
//    /**
//     * Finishes launching of facebook (must be called in the associated method of the AppDelegate)
//     *
//     *  @return true if no error occured
//     */
//    func facebbokManagerdidFinishLaunchingWithOptions(application: UIApplication,  launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
//        return SNSFacebook.application(application, didFinishLaunchingWithOptions: launchOptions)
//    }
//
//    func isLoggedInWithFacebookAccount() -> Bool {
//        return SNSFacebookLogin.isLogged()
//    }
//
//    func checkForSingleFacebookPermission(permission : String) {
//        SNSFacebookLogin.hasPermission(permission)
//    }
//
//    func checkForFacebookPermissions(permissions : [String]) {
//        SNSFacebookLogin.hasPermissions(permissions)
//    }
//
//    // This methods logs the user or add the missing permissions if needed
//    func getUserInfoFromFacebook(userInfo : [String]) {
//        SNSFacebookLogin.log(toRetrieveUserInformations: userInfo, from: mContext) {
//            (result, error) in
//            if (result == nil) {}
//            else if (error == nil) {}
//            else {
////                let userInfo : [String : String] = result as! [String : String]
////                var name = userInfo [SNSFacebookUserInfoName]
////                var email = userInfo[SNSFacebookUserInfoEmail]
////                var pictureUrl = userInfo[SNSFacebookUserInfoPicture]
//            }
//        }
//    }
//
//    func postTextToFacebook(text : String) {
//        SNSFacebookInteractions.postStatus(withMessage: text) {  (result, error) in
//            if (result == nil) {}
//            else if (error == nil) {}
//            else {}
//        }
//    }
//
//    func postTextToFacebookWithDialog(text : String) {
//        SNSFacebookInteractions.postStatus(fromParentViewController: mContext) {  (result, error) in
//            if (result == nil) {}
//            else if (error == nil) {}
//            else {}
//        }
//    }
//
//    func postLinkToFacebookWithDialog(url : String) {
//        SNSFacebookInteractions.postLink(url, parentController: mContext){  (result, error) in
//            if (result == nil) {}
//            else if (error == nil) {}
//            else {}
//        }
//    }
//
//    func postLinkToFacebook(url : String, title : String, description : String) {
//        SNSFacebookInteractions.postLink(url, withTitle: title, description: description, pictureUrl: url) { (result, error) in
//        if (result == nil) {}
//        else if (error == nil) {}
//        else {}
//        }
//    }
//
//    func postImageURLToFacebook(imageURL : String, title : String, description : String) {
//       self.postLinkToFacebook(url: imageURL, title: title, description: description)
//    }
//
//    func postImageToFacebookWithDialog(image : UIImage) {
//        SNSFacebookInteractions.postPhoto(image, fromParentViewController: mContext) { (result, error) in
//            if (result == nil) {}
//            else if (error == nil) {}
//            else {}
//        }
//    }
//
//    func postImagesToFacebookWithDialog(images : [UIImage]) {
//        SNSFacebookInteractions.postPhotos(images, fromParentViewController: mContext) { (result, error) in
//            if (result == nil) {}
//            else if (error == nil) {}
//            else {}
//        }
//    }
//
//    func postImageToFacebook(image : UIImage, description : String) {
//        SNSFacebookInteractions.postPhoto(image, withCaption: description) { (result, error) in
//            if (result == nil) {}
//            else if (error == nil) {}
//            else {}
//        }
//    }

    
    /////////////////////////////////////// Twitter //////////////////////////////////////////
    

    

//    private func isFaceBookInstalled() -> Bool {
//        if(SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook)) {
//            return true
//        }
//        return false
//    }
//
//    private func isTwitterInstalled() -> Bool {
//        if(SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter)) {
//            return true
//        }
//        return false
//    }
//
//    private func isLinkedInInstalled() -> Bool {
//        if(SLComposeViewController.isAvailable(forServiceType: SLServiceTypeLinkedIn)) {
//            return true
//        }
//        return false
//    }
    
// }

//enum SocialMediaError: Error {
//    case FaceBookError(String)
//}

