//
//  AppApiBuilder.swift
//  iOS_Bootstrap_BaseProject
//
//  Created by Ahmad Mahmoud on 6/24/19.
//  Copyright © 2019 Ahmad Mahmoud. All rights reserved.
//

import iOS_Bootstrap

class AppApiBuilder<A>: BaseApiBuilder<AppRestClient<A>, A> where A: GenericAPIs {
    
    override func getBuilder(api: A.Type) -> AppAPIsConnectorConfig<A> {
        return AppAPIsConnectorConfig<A>()
    }
    
    override func getBuilderWithoutLoadingIndicator(api: A.Type) -> AppAPIsConnectorConfig<A> {
        return AppAPIsConnectorConfig<A>(enableLoadingActivity: false)
    }
}
