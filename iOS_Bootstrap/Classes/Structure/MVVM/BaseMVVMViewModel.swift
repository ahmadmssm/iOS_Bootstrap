//
//  BaseMVVMViewModel.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 6/22/19.
//

import RxSwift

open class BaseMVVMViewModel: ViewModelFunctions {
    
    private var disposeBag : DisposeBag!
    
    
    required public init () {}
    
    public final func getDisposeBag() -> DisposeBag {
        if (disposeBag == nil) { disposeBag = DisposeBag() }
        return disposeBag
    }
    
    open func viewControllerDidLoad() {}
    
    open func viewControllerDidFinishSettingUpUI() {}
    
    open func viewControllerWillRefresh() {}
    
    open func viewControllerWillDisappear() {}
    
    open func viewControllerDidAppear() {}
    
    open func logOut() {}
    
    deinit {
        if (disposeBag != nil) { disposeBag = nil }
    }
}
