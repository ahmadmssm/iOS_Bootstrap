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
    private static var svgImageHelper: SVGImageLoader = SVGImageLoader()
    func loadSVGfrom(url: String, disposeBag: DisposeBag) {
        _ = UIImageView.svgImageHelper.loadFrom(svgImageURL: url)
            .do(onSuccess: { img in self.image = img },
                onError: { error in self.image = #imageLiteral(resourceName: "image_not_found") },
                onSubscribe: {}, onSubscribed: {}, onDispose: {})
            .subscribe()
            .disposed(by: disposeBag)
    }
}
