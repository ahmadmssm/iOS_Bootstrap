//
//  SVGImageLoader.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 12/21/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import RxSwift
import iOS_Bootstrap
import SVGKit
import Resolver

public final class SVGImageLoader: Resolving {

    public func loadFrom(svgImageURL: String) -> Single<UIImage?> {
        let imageCache: NSCache<NSString, UIImage> = resolver.resolve()
        return Single.create { single in
            let url = URL(string: svgImageURL)
            let nsStringURL = (url?.absoluteString)! as NSString
            if let cachedImage = imageCache.object(forKey: nsStringURL) {
                single(.success(cachedImage))
            }
            else {
                let svgImage: SVGKImage = SVGKImage(contentsOf: url)
                let image: UIImage = svgImage.uiImage
                imageCache.setObject(image, forKey: nsStringURL)
                single(.success(image))
            }
            return Disposables.create()
            }
            .subscribeOn(RxSchedulers.imageLoadingScheduler)
            .observeOn(RxSchedulers.uiScheduler)
    }
}

