//
//  LeftSideMenuViewController.swift
//
//
//

import iOS_Bootstrap

@available(iOS 10.0, *)
class LeftSideMenuViewController:
     BaseSideMenuTableViewControllerV2
         <BasePresenter<BaseViewDelegator>, BaseViewDelegator, SideMenuModel, SideMenuCell> {

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var headerViewContainer: UIView!
    @IBOutlet private weak var profileImage: UIImageView!
    @IBOutlet private weak var profileTitle: UILabel!
    
    override func viewDidLoad() { super.viewDidLoad() }
    
    override func viewWillDisappear(_ animated: Bool) { super.viewWillAppear(animated) }
    
    override func initUI() {
        headerViewContainer.backgroundColor = UIColor.color(fromHexString: "E0E0E0")
        profileImage.layoutIfNeeded()
        profileImage.layer.cornerRadius = self.profileImage.bounds.size.height / 2
        profileImage.clipsToBounds = true
        profileImage.layer.borderWidth = 1
        profileImage.layer.borderColor = UIColor.white.cgColor
        profileTitle.text = "John Doe"
    }
    
    override func setupMenuItemsData() -> [SideMenuModel] {
        var menu: [SideMenuModel] = []
        let trendingMoviesMenuItem = SideMenuModel(itemName: "Trending Movies", itemId: 0, itemIcon: #imageLiteral(resourceName: "trending_movies"))
        let countriesListMenuItem = SideMenuModel(itemName: "World Countries", itemId: 1, itemIcon: #imageLiteral(resourceName: "world_countries"))
        let toDoListMenuItem = SideMenuModel(itemName: "Todo", itemId: 1, itemIcon: #imageLiteral(resourceName: "world_countries"))
        let weatherProviderMenuItem = SideMenuModel(itemName: "Weather provider", itemId: 2, itemIcon: #imageLiteral(resourceName: "weather"))
        menu.append(trendingMoviesMenuItem)
        menu.append(countriesListMenuItem)
        menu.append(toDoListMenuItem)
        menu.append(weatherProviderMenuItem)
        return menu
    }
    
    override func setupSideMenuTableView() -> UITableView { return tableView }
    
    override func setupSideMenuItemCell(indexPath: IndexPath, menuItem: SideMenuModel) -> UITableViewCell {
        let menuCell: SideMenuCell = self.initCell(indexPath: indexPath)
        return menuCell
    }
    
    override func setupSideMenuViewControllers() -> [UIViewController] {
        var menuViewControllers: [UIViewController] = []
        let storyboard = UIStoryboard.getStoryboardWithName(Storyboards.sideMenuTabBar)
        let trendingMoviesViewController = TrendingMoviesViewController()
        menuViewControllers.append(GradientNavigationController(rootViewController: trendingMoviesViewController))
        if #available(iOS 11.0, *) {
            let countriesListViewController: CountriesViewController = CountriesViewController()
            menuViewControllers.append(GradientNavigationController(rootViewController: countriesListViewController))
        }
        let toDoListMenuItemViewController: ToDoViewPagerController = ToDoViewPagerController()
        menuViewControllers.append(GradientNavigationController(rootViewController: toDoListMenuItemViewController))
        let weatherViewController: WeatherMenuItemTabBarController = storyboard.instantiateViewController()
        menuViewControllers.append(GradientNavigationController(rootViewController: weatherViewController))
        return menuViewControllers
    }
    
    override func menuItemDidSelected(menu: SideMenuModel, menuItemIndex: Int, viewControllerAtIndex: UIViewController) {
        self.replaceVisableMenuViewControllerWith(menuItemViewController: viewControllerAtIndex, closeMenu: true)
    }
    
    open override func performBackAction() {
        Navigator.startInitialView()
    }
    
}



