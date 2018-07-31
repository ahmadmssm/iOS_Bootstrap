//
//  API_Configuration.swift
//  NetworkAbstractLayer_sample
//
//  Created by Ahmad Mahmoud on 4/7/18.
//  Copyright © 2018 Ahmad Mahmoud. All rights reserved.
//

import iOS_Bootstrap

enum APIs {
    
    case getWorldCountries()
    case doRequestThatReturnsAnError()
    case getCountryDetailsByCountryName(countryName : String)
    case getUsers(page : String)
    case refreshToken(token: String)
}

extension APIs : GenericAPIs, AccessTokenAuthorizable {
    
    // override default url building behavior
    var baseURL: URL {
        switch self {
        case .doRequestThatReturnsAnError():
            return URL(string: "https://fcm.googleapis.com/fcm/send")!
        case .getWorldCountries(),
             .getCountryDetailsByCountryName ( _):
            return URL(string: "https://restcountries.eu/rest/v2")!
        case .getUsers( _):
            return URL(string: "https://reqres.in/api/users")!
        default :
            return URL(string: "https://fcm.googleapis.com/fcm/send")!
        }
    }
    
    // method + path
    var route: Route {
        switch self {
        case .getWorldCountries():
            return .get("//all")
        case .getCountryDetailsByCountryName(let countryName):
            return .get("/all")
//            return .get("/name/\(countryName)")
        case .getUsers( _):
            return .get("")
        case .refreshToken(let token):
            return .post("")
        case .doRequestThatReturnsAnError:
            return .post("")

        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .doRequestThatReturnsAnError():
            return [
                "Content-Type": "application/json",
                "Authorization": "key=AAAAF2vApGE:APA91bEV8Ao4LEX7fCu03ppNKMao6EOmeBOVLLxKv1gwte2-klmsT4BYwDaa-1NEt2eeo1avkqpXmvf4dJqR7nI5XNL8x6hU4DWXX9Q9Vl00uZLaYahtJKoqsZuhJblr7x3aPv060vkrCcC2Y7XY5VsQHv-KsziEe"]
        default:
            return nil
        }
    }
    
    var authorizationType: AuthorizationType {
        switch self {
        case .doRequestThatReturnsAnError():
            return .bearer
        default:
            return .none
        }
    }
   
    // Encoding + Parameters
    // Use `URLEncoding()` as default when not specified
    var parameters: Parameters? {
        //
            
        //
        switch self {
        case .doRequestThatReturnsAnError():
            return JSONEncoding() => ["to": "chUJ_9nB_8k:APA91bH-Olg14cX82NpqANQKvIgWAet3O7c_4tuEmW7q1i-VE7PASsOwfqLyPpI3uZEuRCyg6zldof83N9JG9QuZ11GHIABPwLhMk45I4gb7sDnwsmNw-hcH_tAs4fmJkotowcIceTxm3DArq_-UHMk-ZB3FPydUKgQ"]
        case.getCountryDetailsByCountryName(_):
            return nil
        case .getUsers(let page):
            return URLEncoding() => ["page": page]
        case .getWorldCountries():
            return nil
        case .refreshToken(let token):
            return nil
        }
    }
    
    var sampleData: Data { return Data() }
    
}
