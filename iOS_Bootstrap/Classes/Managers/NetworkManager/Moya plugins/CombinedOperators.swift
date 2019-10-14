//
//  CombinedOperators.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 11/23/18.
//

import RxSwift

public extension PrimitiveSequence where TraitType == SingleTrait, ElementType == Response {
    func applyFilterStatusCodeAndProcessErrorsAndTokenRefresh (tokenRefreshDelegate : TokenRefresh) -> Single<Response> {
        return self
            .filterSuccessfulStatusAndRedirectCodesAndProcessErrors()
            .refreshAuthenticationTokenIfNeeded(tokenRefreshDelegate: tokenRefreshDelegate)
    }
}

