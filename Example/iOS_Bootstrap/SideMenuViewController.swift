//
//  SideMenuViewController.swift
//  SlideMenuControllerSwift
//
//  Created by Yuji Hato on 12/3/14.
//

import iOS_Bootstrap

class SideMenuViewController :
            BaseSideMenuViewController
                    <BasePresenter<BaseViewDelegator>, BaseViewDelegator, SideMenuModel> {

    //
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerViewContainer: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileTitle: UILabel!

    
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
        var menu : [SideMenuModel] = []
        let trendingMoviesMenuItem = SideMenuModel(itemName: "Trending Movies", itemId: 0, itemIcon: #imageLiteral(resourceName: "trending-movies"))
        let countriesListMenuItem = SideMenuModel(itemName: "World Countries", itemId: 1, itemIcon: #imageLiteral(resourceName: "bill"))
        let weatherProviderMenuItem = SideMenuModel(itemName: "Weather provider", itemId: 2, itemIcon: #imageLiteral(resourceName: "bill"))
        menu.append(trendingMoviesMenuItem)
        menu.append(countriesListMenuItem)
        menu.append(weatherProviderMenuItem)
        return menu
    }
    
    override func setupSideMenuTableView() -> UITableView { return tableView }
    
    override func setupMenuItemCell() -> BaseTableViewCell.Type { return SideMenuCell.self }
    
    override func setupSideMenuItemCell(indexPath: IndexPath, menuItem: SideMenuModel) -> UITableViewCell {
        let menuCell : SideMenuCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        menuCell.itemIcon.image = menuItem.icon
        menuCell.itemLabel.text = menuItem.itemName
        return menuCell
    }
    
    override func setupSideMenuViewControllers() -> [UIViewController] {
        var menuViewControllers : [UIViewController] = []
        let storyboard = UIStoryboard.getStoryboardWithName(Storyboards.menu)
        let trendingMoviesViewController : TrendingMoviesViewController = storyboard.instantiateViewController()
        menuViewControllers.append(UINavigationController(rootViewController: trendingMoviesViewController))
        let countriesListViewController : CountriesViewController = storyboard.instantiateViewController()
        menuViewControllers.append(UINavigationController(rootViewController: countriesListViewController))
        let weatherViewController : WeatherMenuItemTabBarController = storyboard.instantiateViewController()
        menuViewControllers.append(UINavigationController(rootViewController: weatherViewController))
        return menuViewControllers
    }
    
    // override func shouldBlurBackgroundItem() -> Bool { return true }
    
    //
    override func menuItemDidSelected(menu: SideMenuModel, menuItemIndex: Int, viewControllerAtIndex: UIViewController) {
        self.replaceVisableMenuViewControllerWith(menuItemViewController: viewControllerAtIndex, closeMenu: true)
    }
    
    open override func performBackAction() {
        Navigator.startInitialView()
    }

}


