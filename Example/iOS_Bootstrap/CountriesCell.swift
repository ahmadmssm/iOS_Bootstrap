//
//  CountriesCell.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 6/8/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import iOS_Bootstrap
import RxSwift

class CountriesCell: BaseReusableTableViewCell<CountryEntity> {
    
    @IBOutlet weak var labelCountryName: UILabel!
    @IBOutlet weak var labelCapitalName: UILabel!
    @IBOutlet weak var labelRegion: UILabel!
    @IBOutlet weak var labelTimeZone: UILabel!
    @IBOutlet weak var imageViewFlag: UIImageView!
    
    private var disposeBag: DisposeBag!
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        disposeBag = DisposeBag()
    }
    
    deinit { disposeBag = nil }
    
    override func initCellFrom(cellModel: CountryEntity) {
        if let countryName = cellModel.name { labelCountryName.text = countryName }
        if let capitalName = cellModel.capital { labelCapitalName.text = capitalName }
        if let continental = cellModel.continental { labelRegion.text = continental }
        if let timeZone = labelTimeZone.text { labelTimeZone.text = timeZone }
        if let flagURL = cellModel.flagURL {
            imageViewFlag.loadSVGfrom(url: flagURL, disposeBag: disposeBag)
        }
    }
    
}
