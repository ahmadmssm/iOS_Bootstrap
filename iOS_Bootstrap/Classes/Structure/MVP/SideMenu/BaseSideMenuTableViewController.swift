//
//  BaseSideMenuTableViewController.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 10/28/18.
//
    
open class BaseSideMenuTableViewController<T, V, M> :
                                    BaseTableViewController<T, V, M>,
                                    BaseTableViewDelegates,
                                    SlideMenuControllerDelegate
                                    where T : BasePresenter<V>, M : BaseSideMenuModel {
    
    private var menuItems : [M]?
    private var menuViewControllers : [UIViewController]?
    public var mainViewController: UIViewController!
    // Life cycle functions
    open override func viewDidLoad() {
        menuItems = setupMenuItemsData()
        menuViewControllers = setupSideMenuViewControllers()
        super.viewDidLoad()
        // if (shouldBlurBackgroundItem()) { addBlurEffect() }
        getTableViewAdapter().reloadTable()
        // Listen for back button action from menu items if needed
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

    public final override func initTableViewAdapterConfiguraton() {
        getTableViewAdapter().configureTableWithXibCell(tableView: setupSideMenuTableView(), nibClass: setupMenuItemCell(), delegate: self)
        getTableViewAdapter().configurePaginationParameters(totalNumberOfItems: (menuItems?.count)!, itemsPerPage: (menuItems?.count)!)
        initDataSourceIfNeeded(tableViewDataSource: setupMenuItemsData())
    }
    
    private func addBlurEffect() {
        // Set the background of the view controller to clear (transparent)
        self.view.backgroundColor = UIColor.clear
        // Create a blur effect
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        // Fill the view
        blurEffectView.frame = view.bounds
        // Ensure the blur conforms to resizing (not used in a fixed menu UI)
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        // Add the view to the view controller stack
        view.addSubview(blurEffectView)
        // Ensure the blur view is in the back
        self.view.sendSubview(toBack: blurEffectView)
    }
    
    // Side menu configuration functions
    //
    open func setupMenuItemsData() -> [M] {
        fatalError("Must Override")
    }
    //
    open func setupSideMenuTableView() -> UITableView {
        fatalError("Must Override")
    }
    //
    open func setupMenuItemCell() -> BaseTableViewCell.Type? {
        fatalError("Must Override")
    }
    //
    open func setupSideMenuItemCell(indexPath: IndexPath, menuItem : M) -> UITableViewCell {
        fatalError("Must Override")
    }
    //
    open func setupSideMenuViewControllers() -> [UIViewController] {
        fatalError("Must Override")
    }
    //
    // open func shouldBlurBackgroundItem() -> Bool { return false }
    //
    // Actions
    //
    open func menuItemDidSelected(menu : M, menuItemIndex : Int, viewControllerAtIndex : UIViewController) {}
    //
    public final func replaceVisableMenuViewControllerWith(menuItemViewController: UIViewController, closeMenu : Bool) {
        self.slideMenuController()?.changeMainViewController(menuItemViewController, close: closeMenu)
    }
    
    // Base tableview adapter delegates
    //
    public func configureCellForRow(tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return setupSideMenuItemCell(indexPath: indexPath, menuItem: menuItems![indexPath.row])
    }
    //
    public func rowDidSelected(tableView: UITableView, indexPath: IndexPath) {
        menuItemDidSelected(menu: menuItems![indexPath.row], menuItemIndex: indexPath.row, viewControllerAtIndex: menuViewControllers![indexPath.row])
    }
    
    open func performBackAction() {}

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
