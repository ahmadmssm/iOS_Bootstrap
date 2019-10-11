//
//  ImageLoadingService.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 11/22/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

public protocol ImageLoadingService {
    
    func loadImage(with url: URL)
    
    func loadImage(with url: URL,
                   options: ImageLoadingOptions?,
                   progress: ImageTask.ProgressHandler?,
                   completion: ImageTask.Completion?)
    
    func loadImage(with url: URL, options: ImageLoadingOptions?)
    
    func loadImage(with url: URL,
                   options: ImageLoadingOptions?,
                   completion: ImageTask.Completion?)
    
    func loadImage(with url: URL,
                   options: ImageLoadingOptions?,
                   progress: ImageTask.ProgressHandler?)
    
    func loadImage(with url: URL, progress: ImageTask.ProgressHandler?)
    
    func loadImage(with url: URL,
                   progress: ImageTask.ProgressHandler?,
                   completion: ImageTask.Completion?)
}

public extension ImageLoadingService where Self: UIImageView {
    
    func loadImage(with url: URL) {
        ImageLoader.loadImage(with: url, into: self)
    }
    
    func loadImage(with url: URL,
                   options: ImageLoadingOptions?,
                   progress: ImageTask.ProgressHandler?,
                   completion: ImageTask.Completion?) {
        ImageLoader.loadImage(with: url, options: options!, into: self, progress: progress, completion: completion)
    }
    
    func loadImage(with url: URL, options: ImageLoadingOptions?) {
        ImageLoader.loadImage(with: url, options: options!, into: self)
    }
    
    func loadImage(with url: URL,
                   options: ImageLoadingOptions?,
                   completion: ImageTask.Completion?){
        ImageLoader.loadImage(with: url, options: options!, into: self, completion: completion)
    }
    
    func loadImage (with url: URL,
                    options: ImageLoadingOptions?,
                    progress: ImageTask.ProgressHandler?) {
        ImageLoader.loadImage(with: url, options: options!, into: self, progress: progress)
    }
    
    func loadImage (with url: URL, progress: ImageTask.ProgressHandler?) {
        ImageLoader.loadImage(with: url, into: self, progress: progress)
    }
    
    func loadImage (with url: URL,
                    progress: ImageTask.ProgressHandler?,
                    completion: ImageTask.Completion?) {
        ImageLoader.loadImage(with: url, into: self, progress: progress, completion: completion)
    }
}

