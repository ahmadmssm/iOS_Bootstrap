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

class CountriesCell: BaseGenericTableViewCell<CountryEntity> {
    
    @IBOutlet private weak var labelCountryName: UILabel!
    @IBOutlet private weak var labelCapitalName: UILabel!
    @IBOutlet private weak var labelRegion: UILabel!
    @IBOutlet private weak var labelTimeZone: UILabel!
    @IBOutlet private weak var imageViewFlag: UIImageView!
    
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
        if let timeZone = cellModel.timeZone { labelTimeZone.text = timeZone }
        if let flagURL = cellModel.flagURL {
            imageViewFlag.loadSVGfrom(url: flagURL, disposeBag: disposeBag)
        }
    }
    
}
