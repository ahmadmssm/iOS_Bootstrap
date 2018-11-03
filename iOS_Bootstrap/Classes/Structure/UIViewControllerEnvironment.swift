//
//  UIViewControllerEnvironment.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 10/27/18.
//

extension UIViewController : ViewControllerCommonFeatures {
    
    private static var snackBar : TTGSnackbar?

    public var snackbar : TTGSnackbar? {
        set (newSnackbar) { UIViewController.snackBar = newSnackbar }
        get { return UIViewController.snackBar }
    }
    
    public final var getDefaultSnackbar : TTGSnackbar? {
        get { return DefaultConfigurations.snackBar }
    }

    open func configureSnackBar()  {
        snackbar = TTGSnackbar(message: "",duration: .short)
        snackbar?.backgroundColor = UIColor.blue
    }
        
    func setupViewWillAppearEssentials() {
        setContext(context: self)
        InternetConnectionManager.getInstance.addListener(listener: self)
        configureSnackBar()
    }
    
    func setupViewDidDisappearEssentials() {
        InternetConnectionManager.getInstance.removeListener(listener: self)
        if (getDefaultSnackbar != nil && !(getDefaultSnackbar?.isHidden)!) {
            getDefaultSnackbar?.dismiss()
        }
        else if (snackbar != nil && !(snackbar?.isHidden)!) {
            getDefaultSnackbar?.dismiss()
        }
    }
    
    open func networkStatusDidChanged(status: InternetConnectionManager.Connection) {
        snackbar?.dismiss()
        if (status == InternetConnectionManager.Connection.notConnected) {
            snackbar?.actionText = "Dismiss"
            snackbar?.actionBlock = { snackbar in
                snackbar.dismiss()
            }
            self.snackbar?.message = "Network became unreachable"
            self.snackbar?.duration = .forever
            DispatchQueue.main.async {
                self.snackbar?.show()
            }
        }
    }
    
}
