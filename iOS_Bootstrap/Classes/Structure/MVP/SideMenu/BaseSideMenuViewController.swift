//
//  BaseSideMenuViewController.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 10/28/18.
//

open class BaseSideMenuViewController<T, V, M> :
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
        getTableViewAdapter.reloadTable()
    }
    
    override open func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
    }
    
    open override func initTableViewAdapterConfiguraton() {
        getTableViewAdapter.configureTableWithXibCell(tableView: setupSideMenuTableView(), nibClass: setupMenuItemCell(), delegate: self)
        getTableViewAdapter.configurePaginationParameters(totalNumberOfItems: (menuItems?.count)!, itemsPerPage: (menuItems?.count)!)
        initDataSourceIfNeeded(tableViewDataSource: setupMenuItemsData())
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
    
    // Actions
    //
    open func menuItemDidSelected(menu : M, menuItemIndex : Int, viewControllerAtIndex : UIViewController) {}
    //
    public final func replaceVisableMenuViewControllerWith(menuItemViewController: UIViewController, closeMenu : Bool) {
        self.slideMenuController()?.changeMainViewController(menuItemViewController, close: closeMenu)
    }
    
    // Base tableview adapter delegates
    //
    public func configureTableViewCell(tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return setupSideMenuItemCell(indexPath: indexPath, menuItem: menuItems![indexPath.row])
    }
    //
    public func rowDidSelected(indexPath: IndexPath) {
        menuItemDidSelected(menu: menuItems![indexPath.row], menuItemIndex: indexPath.row, viewControllerAtIndex: menuViewControllers![indexPath.row])
    }
    
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
