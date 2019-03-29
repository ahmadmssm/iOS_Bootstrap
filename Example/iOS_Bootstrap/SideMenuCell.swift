//
//  SideMenuCell.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 10/29/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import iOS_Bootstrap

class SideMenuCell: BaseTableViewCellV2<SideMenuModel> {

    @IBOutlet private weak var itemIcon: UIImageView!
    @IBOutlet private weak var itemLabel: UILabel!
    
    public required init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder) }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
  
    override func initCellFrom(cellModel: SideMenuModel) {
        itemIcon.image = cellModel.icon
        itemLabel.text = cellModel.itemName
    }
    
    func setData(_ data: Any?) {
        self.backgroundColor = UIColor.color(fromHexString: "F1F8E9")
        self.textLabel?.font = UIFont.italicSystemFont(ofSize: 18)
        self.textLabel?.textColor = UIColor.color(fromHexString: "9E9E9E")
        if let menuText = data as? String { self.textLabel?.text = menuText }
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        if highlighted { self.alpha = 0.4 }
        else { self.alpha = 1.0 }
    }
    
}
