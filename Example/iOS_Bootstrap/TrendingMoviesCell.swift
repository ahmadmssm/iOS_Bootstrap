//
//  TrendingMoviesCell.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 11/2/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

class TrendingMoviesCell: BaseTableViewCellV2<TrendingMovieCellModel> {
    
    @IBOutlet private weak var posterImage: UIImageView!
    @IBOutlet private weak var movieTitleLabel: UILabel!
    @IBOutlet private weak var releaseDateLabel: UILabel!
    @IBOutlet private weak var votingLabel: UILabel!
    @IBOutlet private weak var movieLanguage: UILabel!
    
    
    override func initCellFrom(cellModel: TrendingMovieCellModel) {
        movieTitleLabel.text = cellModel.movieTitle
        releaseDateLabel.text = cellModel.releaseDate
        votingLabel.text = (cellModel.voting?.toString(withDecimalPoints: 1))! + "  \u{2B50}"
        movieLanguage.text = cellModel.originalLanguage
        //
        if let imageURL = cellModel.imageURL {
            let posterURL = URL(string: imageURL)
            posterImage.loadImage(with: posterURL!)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
}
