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

    public func loadFrom(svgImageURL: String) -> Observable<UIImage?> {
        return Observable.create { observer in
            let url = URL(string: svgImageURL)
            if let cachedImage = SVGimageHelper.imageCache.object(forKey: url?.absoluteString as! NSString) { observer.onNext(cachedImage) }
            else {
                let svgImage: SVGKImage = SVGKImage(contentsOf: url)
                let image: UIImage = svgImage.uiImage
                SVGimageHelper.imageCache.setObject(image, forKey: url?.absoluteString as! NSString)
                observer.onNext(image)
            }
            observer.on(.completed)
            return Disposables.create()
            }
            .subscribeOn(Schedulers.imageLoadingScheduler).observeOn(Schedulers.uiScheduler)
    }
}

