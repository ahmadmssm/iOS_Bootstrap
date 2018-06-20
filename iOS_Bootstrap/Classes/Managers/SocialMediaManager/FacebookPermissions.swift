//
//  File.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 6/20/18.
//
//  Ref : https://developers.facebook.com/docs/facebook-login/permissions/

import Foundation

public enum FacebookPermissions : CustomStringConvertible {
    
    // Read Permissions - User Attributes
    case email
    case public_profile
    case user_friends
    // If your app requests this permission Facebook will have to review how your app uses it.
    case user_age_range
    // If your app requests this permission Facebook will have to review how your app uses it.
    case user_birthday
    // If your app requests this permission Facebook will have to review how your app uses it.
    case user_gender
    // If your app requests this permission Facebook will have to review how your app uses it.
    case user_hometown
    // Provides access to the Facebook profile URL for another user of the app.
    // If your app requests this permission Facebook will have to review how your app uses it.
    case user_link
    // If your app requests this permission Facebook will have to review how your app uses it.
    case user_location
    //
    case userID
    case userName
    case userFirstName
    case userMiddleName
    case userLastName
    case userEmail
    case userWebsite
    case userAgeRange
    case userBirthday
    case userGender
    case userAbout
    case userBio
    case userRelationshipStatus
    case userHometown
    case userPicture
    case userPictureSmall
    case userPictureAlbum
    case userPictureLarge
    case userPictureSquare
    // Read Permissions - User Activity
    case user_likes
    case user_photos
    case user_posts
    case user_tagged_places
    case user_videos
    // Read Permissions - User Events and Groups
    case groups_access_member_info
    case user_events
    case user_managed_groups
    // Write Permission - User Events and Groups
    case publish_to_groups
    //  Messenger Platform Permissions
    case pages_messaging

    
    //
    public var description : String {
        switch self {
        case .email: return "email"
        case .public_profile: return "public_profile"
        case .user_age_range: return "user_age_range"
        case .user_birthday: return "user_birthday"
        case .user_friends: return "user_friends"
        case .user_gender: return "user_gender"
        case .user_hometown: return "user_hometown"
        case .user_link: return "user_link"
        case .user_location: return "user_location"
        case .userID: return "id"
        case .userName: return "name"
        case .userFirstName: return "first_name"
        case .userMiddleName: return "middle_name"
        case .userLastName: return "last_name"
        case .userEmail: return "email"
        case .userWebsite: return "website"
        case .userAgeRange: return "age_range"
        case .userBirthday: return "birthday"
        case .userGender: return "gender"
        case .userAbout: return "about"
        case .userBio: return "bio"
        case .userRelationshipStatus: return "relationship_status"
        case .userHometown: return "hometown"
        case .userPicture: return "picture"
        case .userPictureSmall: return "picture_small"
        case .userPictureAlbum: return "picture_album"
        case .userPictureLarge: return "picture_large"
        case .userPictureSquare: return "picture_square"
        case .user_likes: return "user_likes"
        case .user_photos: return "user_photos"
        case .user_posts: return "user_posts"
        case .user_tagged_places: return "user_tagged_places"
        case .user_videos: return "user_videos"
        case .groups_access_member_info: return "groups_access_member_info"
        case .user_events: return "user_events"
        case .user_managed_groups: return "user_managed_groups"
        case .publish_to_groups: return "publish_to_groups"
        case .pages_messaging: return "pages_messaging"
        }
    }
    
}
