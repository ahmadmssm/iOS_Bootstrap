//
//  BaseSideMenuController.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 10/28/18.
//

open class BaseSideMenuController : SlideMenuController {
    
    open override func initView() {
        configureMenuPropsIfNeeded()
        super.initView()
    }
    
    open func getVisableViewController() -> UIViewController? {
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            return topController
        }
        return nil
    }
    
    open func configureMenuPropsIfNeeded() {
        SlideMenuOptions.hideStatusBar = false
        SlideMenuOptions.contentViewScale = 1
    }
    
}

//open class BaseSideMenuController <T, V> : GenericSideMenuController where T : BasePresenter<V> {
//    
//    private var presenter : T!
//    
//    override open func viewDidLoad() {
//        super.viewDidLoad()
//        self.presenter = T.init()
//        initUI()
//    }
//    //
//    override open func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        setupViewWillAppearEssentials()
//    }
//    //
//    override open func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//        setupViewDidDisappearEssentials()
//    }
//    
//    public final var getPresenter : T {
//        get {
//            if (presenter.getViewDelegator == nil) {
//                presenter.attachView(contract: self as! V)
//            }
//            return presenter
//        }
//    }
//    
//    open func initUI () {}
//   
//}

