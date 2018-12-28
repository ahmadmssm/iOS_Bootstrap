//
//  MainViewCell.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 11/2/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import iOS_Bootstrap

class MainViewCell: BaseCollectionViewCellV2<String> {

    @IBOutlet private weak var image: UIImageView!
    @IBOutlet private weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Same image for all cells, That is why it is placed here
        image.image = #imageLiteral(resourceName: "example")
    }
    
    override func initCellFrom(cellModel: String) { label.text = cellModel }

}
