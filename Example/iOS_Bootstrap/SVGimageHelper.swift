//
//  SVGimageHelper.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 12/21/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import RxSwift
import iOS_Bootstrap
import SVGKit

public final class SVGimageHelper {

    private static let imageCache = NSCache<NSString, UIImage>()

    public func loadFrom(svgImageURL: String) -> Single<UIImage?> {
        return Single.create { single in
            let url = URL(string: svgImageURL)
            if let cachedImage = SVGimageHelper.imageCache.object(forKey: url?.absoluteString as! NSString) {
                single(.success(cachedImage))
            }
            else {
                let svgImage: SVGKImage = SVGKImage(contentsOf: url)
                let image: UIImage = svgImage.uiImage
                SVGimageHelper.imageCache.setObject(image, forKey: url?.absoluteString as! NSString)
                single(.success(image))
            }
            return Disposables.create()
            }
            .subscribeOn(Schedulers.imageLoadingScheduler)
            .observeOn(Schedulers.uiScheduler)
    }
    
}

