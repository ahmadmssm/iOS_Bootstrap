//
//  BaseMVVMView.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 6/22/19.
//

import UIKit

open class BaseMVVMView<VM>: UIViewController,
                             ViewControllerCommonEnv
                             where VM: BaseMVVMViewModel {
    
    private var viewModel: VM!
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = initViewModel()
        getViewModel().viewControllerDidLoad()
        initUI()
        bindViewModel()
        localizeStrings()
        getViewModel().viewControllerDidFinishSettingUpUI()
    }

    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupViewWillAppearEssentials()
        getViewModel().viewControllerWillRefresh()
    }

    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getViewModel().viewControllerDidAppear()
    }

    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if (viewModel != nil) {
            getViewModel().viewControllerWillDisappear()
        }
    }

    override open func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        setupViewDidDisappearEssentials()
    }
    
    public final func getViewModel() -> VM {
        if (viewModel == nil) {
            self.viewModel = VM.init()
        }
        return viewModel
    }
    
    open func initUI () { fatalError("Must Override") }
    
    open func bindViewModel () { fatalError("Must Override") }

    open func localizeStrings () { fatalError("Must Override") }
    
    open func initViewModel () -> VM? { return nil }
    
    open func showLoading() {}
    
    open func hideLoading() {}
    
    open func didGetWarning(warningMessage: String) {}
    
    open func didGetError(errorMessage: String) {}
    
    open func notify(_ isConnected: Bool, _ isWiFi: Bool?, _ error: String?) {}
}


