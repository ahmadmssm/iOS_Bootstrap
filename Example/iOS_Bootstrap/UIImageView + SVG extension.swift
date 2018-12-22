//
//  UIImageView + SVG extension.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 12/21/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import RxSwift

extension UIImageView {
    private static var svgImageHelper: SVGimageHelper = SVGimageHelper()
    func loadSVGfrom(url: String, disposeBag: DisposeBag) {
        _ = UIImageView.svgImageHelper.loadFrom(svgImageURL: url)
            .do(onNext: { image in self.image = image },
                onError: { error in self.image = #imageLiteral(resourceName: "image_not_found")}, onCompleted: {},
                onSubscribe: {}, onSubscribed: {},
                onDispose: {})
            .subscribe()
            .disposed(by: disposeBag)
    }
}
