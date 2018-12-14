//
//  TrendingMoviesCell.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 11/2/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import iOS_Bootstrap

class TrendingMoviesCell: BaseTableViewCell {
    
    @IBOutlet private weak var posterImage: UIImageView!
    @IBOutlet private weak var movieTitleLabel: UILabel!
    @IBOutlet private weak var releaseDateLabel: UILabel!
    @IBOutlet private weak var votingLabel: UILabel!
    @IBOutlet private weak var movieLanguage: UILabel!
    
    var cellMode: TrendingMovieCellModel? {
        didSet {
            movieTitleLabel.text = cellMode?.movieTitle
            releaseDateLabel.text = cellMode?.releaseDate
            votingLabel.text = (cellMode?.voting?.toString(withDecimalPoints: 1))! + "  \u{2B50}"
            movieLanguage.text = cellMode?.originalLanguage
            //
            if let imageURL = cellMode?.imageURL {
                let posterURL = URL(string: imageURL)
                posterImage.loadImage(with: posterURL!)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
}
