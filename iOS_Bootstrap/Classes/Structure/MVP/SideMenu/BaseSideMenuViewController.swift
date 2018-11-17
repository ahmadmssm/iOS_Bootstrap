//
//  BaseSideMenuViewController.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 11/17/18.
//

open class BaseSideMenuViewController<T, V> :
                                BaseViewController<T, V>,
                                SlideMenuControllerDelegate
                                where T : BasePresenter<V> {
    
    public var mainViewController: UIViewController!
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        EventBus.onMainThread(self, name: "com.iOS_Bootstrap.performBackAction") { result in
            // UI thread
            self.performBackAction()
        }
    }
    
    override open func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
    }
    
    open override func viewWillDisappear(_ animated: Bool) { EventBus.unregister(self) }
    
    open override func initUI() {}
    
    //
    public final func replaceVisableMenuViewControllerWith(menuItemViewController: UIViewController, closeMenu : Bool) {
        self.slideMenuController()?.changeMainViewController(menuItemViewController, close: closeMenu)
    }
    
    open func performBackAction() {}
    
    public final func addMenuItemClickAction(view : UIView) {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.gestureSelector(gestureRecognizer:)))
        view.addGestureRecognizer(tapGesture)
    }
   
    public final func addMenuItemsClickAction(views : [UIView]) {
        for view in views { addMenuItemClickAction(view: view) }
    }
    
    @objc private func gestureSelector(gestureRecognizer : UIGestureRecognizer) {
        let view = gestureRecognizer.view
        let viewLocation = gestureRecognizer.location(in: view)
        let clickedView  = view?.hitTest(viewLocation, with: nil)
        if (clickedView != nil) { menuItemDidClicked(view: clickedView!) }
    }
    
    open func menuItemDidClicked(view : UIView) {}
    
    //
    open func leftWillOpen() {}
    open func leftDidOpen() {}
    open func leftWillClose() {}
    open func leftDidClose() {}
    //
    open func rightWillOpen() {}
    open func rightDidOpen() {}
    open func rightWillClose() {}
    open func rightDidClose() {}
}
