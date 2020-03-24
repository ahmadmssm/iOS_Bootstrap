//
//  AppRestClient.swift
//  iOS_Bootstrap_BaseProject
//
//  Created by Ahmad Mahmoud on 6/24/19.
//  Copyright © 2019 Ahmad Mahmoud. All rights reserved.
//

import RxSwift
import iOS_Bootstrap

class AppRestClient: RxAlamofireRestClient {
    
    init(_ sessionService: SessionService, _ loadingIndicatorService: LoadingIndicatorService) {
        super.init(sessionService, loadingIndicatorService)
    }
    
    override func getBaseURL() -> String {
        return ""
    }
    
    override func getRefreshTokenAPI() -> BaseRefreTokenAPI? {
        return nil
    }
    
    override func getAdditionalRequestIntercepters() -> [RequestIntercepterProtocol] {
        return [BaseURLChanger()]
    }
    
    override func shouldEnableLoadingIndicator() -> Bool {
        return true
    }
}
