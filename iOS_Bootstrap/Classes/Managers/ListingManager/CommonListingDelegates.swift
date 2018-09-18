//
//  ListingDelegates.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 6/12/18.
//

@objc public protocol CommonListingDelegates {
    
    @objc optional func configureNumberOfSections() -> Int
    @objc optional func loadMore (forPage page : Int, updatedDataSource : [Any])
    @objc optional func configurePullToRefresh (refreshcontrole : UIRefreshControl)
    @objc optional func pullToRefresh (refreshcontrole : UIRefreshControl)
    // Empty dataset callbacks
    @objc optional func emptyDataSetShouldDisplay () -> Bool
    @objc optional func emptyDataSetTitleText () -> NSAttributedString
    @objc optional func emptyDataSetDescriptionText () -> NSAttributedString
    @objc optional func emptyDataSetImage ()  -> UIImage
    @objc optional func emptyDataSetAllowTouch ()  -> Bool
    @objc optional func emptyDataSetClicked (didTap view: UIView!)
    @objc optional func emptyDataSetCustomView () -> UIView
    @objc optional func emptyDataSetBackgroundColor () -> UIColor
    @objc optional func emptyDataSetAnimatedImage () -> CAAnimation
    @objc optional func emptyDataSetButtonLabel () -> NSAttributedString
    @objc optional func emptyDataSetButtonImage () -> UIImage
    @objc optional func emptyDataSetButtonBackgroundImage () -> UIImage
    @objc optional func emptyDataSetButtonTapped (didTapButton button: UIButton)
}

