//
//  UIViewControllerEnvironment.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 10/27/18.
//

public protocol InternetConnectionService: NetworkStatusListener  {
    var snackbar : TTGSnackbar? { set get }
    func configureViewControllerSnackBar()
}
extension InternetConnectionService where Self : UIViewController {
    
    public func configureViewControllerSnackBar()  {
        snackbar = TTGSnackbar(message: "",duration: .short)
        snackbar?.backgroundColor = UIColor.blue
    }
    
    public func networkStatusDidChanged(status: InternetConnectionManager.Connection) {
        snackbar?.dismiss()
        if (status == InternetConnectionManager.Connection.none) {
            snackbar?.actionText = "Dismiss"
            snackbar?.actionBlock = { snackbar in snackbar.dismiss() }
            self.snackbar?.message = "Network became unreachable"
            self.snackbar?.duration = .forever
            DispatchQueue.main.async {
                self.snackbar?.show()
            }
        }
    }
    
    public var snackbar : TTGSnackbar? {
        set (newSnackbar) { UIViewController.snackBar = newSnackbar }
        get { return UIViewController.snackBar }
    }
    
}

extension UIViewController : ViewControllerCommonFeatures {
    
    static var snackBar : TTGSnackbar?
    
    public final var getDefaultSnackbar : TTGSnackbar? {
        get { return DefaultConfigurations.snackBar }
    }
    
    func setupViewWillAppearEssentials() {
        setContext(context: self)
        InternetConnectionManager.getInstance?.addListener(listener: self)
        configureViewControllerSnackBar()
    }
    
    func setupViewDidDisappearEssentials() {
        InternetConnectionManager.getInstance?.removeListener(listener: self)
        if (getDefaultSnackbar != nil && !(getDefaultSnackbar?.isHidden)!) {
            getDefaultSnackbar?.dismiss()
        }
        else if (snackbar != nil && !(snackbar?.isHidden)!) { getDefaultSnackbar?.dismiss() }
    }
    
}
    
    
    


   

