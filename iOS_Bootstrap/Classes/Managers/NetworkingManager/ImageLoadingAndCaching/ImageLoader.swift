//
//  ImageLoader.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 11/20/18.
//

public final class ImageLoader {
    /// Loads an image into the view.
    ///
    /// Before loading the new image prepares the view for reuse by cancelling any
    /// outstanding requests and removing previously displayed images (if any).
    ///
    /// If the image is stored in memory cache, the image is displayed immediately.
    /// If not, the image is loaded using an image pipeline. Displays a `placeholder`
    /// if it was provided. When the request completes the loaded image is displayed
    /// (or `failureImage` in case of an error).
    ///
    /// Nuke keeps a weak reference to the view. If the view is deallocated
    /// the associated request automatically gets cancelled.
    ///
    /// - parameter options: `ImageLoadingOptions.shared` by default.
    /// - parameter progress: A closure to be called periodically on the main thread
    /// when the progress is updated. `nil` by default.
    /// - parameter completion: A closure to be called on the main thread when the
    /// request is finished. Gets called synchronously if the response was found in
    /// memory cache. `nil` by default.
    /// - returns: An image task of `nil` if the image was found in memory cache.
    @discardableResult
    public static func loadImage(with url: URL,
                          options: ImageLoadingOptions = ImageLoadingOptions.shared,
                          into view: ImageDisplayingView,
                          progress: ImageTask.ProgressHandler? = nil,
                          completion: ImageTask.Completion? = nil) -> ImageTask? {
        return loadImage(with: ImageRequest(url: url), options: options, into: view, progress: progress, completion: completion)
    }
    
    /// Loads an image into the view.
    ///
    /// Before loading the new image prepares the view for reuse by cancelling any
    /// outstanding requests and removing previously displayed images (if any).
    ///
    /// If the image is stored in memory cache, the image is displayed immediately.
    /// If not, the image is loaded using an image pipeline. Displays a `placeholder`
    /// if it was provided. When the request completes the loaded image is displayed
    /// (or `failureImage` in case of an error).
    ///
    /// Nuke keeps a weak reference to the view. If the view is deallocated
    /// the associated request automatically gets cancelled.
    ///
    /// - parameter options: `ImageLoadingOptions.shared` by default.
    /// - parameter progress: A closure to be called periodically on the main thread
    /// when the progress is updated. `nil` by default.
    /// - parameter completion: A closure to be called on the main thread when the
    /// request is finished. Gets called synchronously if the response was found in
    /// memory cache. `nil` by default.
    /// - returns: An image task of `nil` if the image was found in memory cache.
    @discardableResult
    public static func loadImage(with request: ImageRequest,
                          options: ImageLoadingOptions = ImageLoadingOptions.shared,
                          into view: ImageDisplayingView,
                          progress: ImageTask.ProgressHandler? = nil,
                          completion: ImageTask.Completion? = nil) -> ImageTask? {
        assert(Thread.isMainThread)
        let controller = ImageViewController.controller(for: view)
        return controller.loadImage(with: request, options: options, progress: progress, completion: completion)
    }
    
    /// Cancels an outstanding request associated with the view.
    public static func cancelRequest(for view: ImageDisplayingView) {
        assert(Thread.isMainThread)
        ImageViewController.controller(for: view).cancelOutstandingTask()
    }
}
