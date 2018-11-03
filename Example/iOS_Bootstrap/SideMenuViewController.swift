//
//  SideMenuViewController.swift
//  SlideMenuControllerSwift
//
//  Created by Yuji Hato on 12/3/14.
//

import UIKit
import iOS_Bootstrap

class SideMenuViewController :
               BaseSideMenuViewController<SideMenuPresenter,
                            SideMenuViewDelegator,
                            ExampleMenuModel>, SideMenuViewDelegator {
    //
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerViewContainer: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileTitle: UILabel!

    
    override func viewDidLoad() { super.viewDidLoad() }
    
    override func initUI() {
        headerViewContainer.backgroundColor = UIColor.color(fromHexString: "E0E0E0")
        profileImage.layoutIfNeeded()
        profileImage.layer.cornerRadius = self.profileImage.bounds.size.height / 2
        profileImage.clipsToBounds = true
        profileImage.layer.borderWidth = 1
        profileImage.layer.borderColor = UIColor.white.cgColor
        profileTitle.text = "Username"
    }
    
    override func setupMenuItemsData() -> [ExampleMenuModel] {
        var menu : [ExampleMenuModel] = []
        let swiftMenuItem = ExampleMenuModel(itemName: "Trending Movies", itemId: 0, itemIcon: #imageLiteral(resourceName: "trending-movies"))
        let javaMenuItem = ExampleMenuModel(itemName: "Java", itemId: 1, itemIcon: #imageLiteral(resourceName: "bill"))
        let goMenuItem = ExampleMenuModel(itemName: "Go", itemId: 2, itemIcon: #imageLiteral(resourceName: "bill"))
        let noMenuItem = ExampleMenuModel(itemName: "Ruby", itemId: 3, itemIcon: #imageLiteral(resourceName: "bill"))
        menu.append(swiftMenuItem)
        menu.append(javaMenuItem)
        menu.append(goMenuItem)
        menu.append(noMenuItem)
        return menu
    }
    
    override func setupSideMenuTableView() -> UITableView { return tableView }
    
    override func setupMenuItemCell() -> BaseTableViewCell.Type { return SideMenuCell.self }
    
    override func setupSideMenuItemCell(indexPath: IndexPath, menuItem: ExampleMenuModel) -> UITableViewCell {
        let menuCell : SideMenuCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        menuCell.itemIcon.image = menuItem.icon
        menuCell.itemLabel.text = menuItem.itemName
        return menuCell
    }
    
    override func setupSideMenuViewControllers() -> [UIViewController] {
        var menuViewControllers : [UIViewController] = []
        let storyboard = UIStoryboard.getStoryboardWithName(Storyboards.menu)
        let trendingMovies : TrendingMoviesViewController = storyboard.instantiateViewController()
        menuViewControllers.append(UINavigationController(rootViewController: trendingMovies))
        let javaViewController : JavaViewController = storyboard.instantiateViewController()
        menuViewControllers.append(UINavigationController(rootViewController: javaViewController))
        let goViewController : GoViewController = storyboard.instantiateViewController()
        menuViewControllers.append(UINavigationController(rootViewController: goViewController))
        let nonMenuController : RubyViewController = storyboard.instantiateViewController()
        menuViewControllers.append(UINavigationController(rootViewController: nonMenuController))
        return menuViewControllers
    }
    
    // override func shouldBlurBackgroundItem() -> Bool { return true }
    
    //
    override func menuItemDidSelected(menu: ExampleMenuModel, menuItemIndex: Int, viewControllerAtIndex: UIViewController) {
        self.replaceVisableMenuViewControllerWith(menuItemViewController: viewControllerAtIndex, closeMenu: true)
    }
    
}


