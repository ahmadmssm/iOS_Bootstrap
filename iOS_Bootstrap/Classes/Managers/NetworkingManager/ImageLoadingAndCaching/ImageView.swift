// The MIT License (MIT)
//
// Copyright (c) 2015-2018 Alexander Grebenyuk (github.com/kean).

import Foundation

#if !os(macOS)
import UIKit.UIImage
/// Alias for `UIImage`.
public typealias Image = UIImage
#else
import AppKit.NSImage
/// Alias for `NSImage`.
public typealias Image = NSImage
#endif

#if !os(watchOS)

/// Displays images. Adopt this protocol in views to make them compatible with
/// Nuke APIs.
///
/// The protocol is defined as `@objc` to enable users to override its methods
/// in extensions (e.g. you can override `display(image:)` in `UIImageView` subclass).
@objc public protocol ImageDisplaying {
    @objc func display(image: Image?)
}

#if !os(macOS)
import UIKit
/// A `UIView` that implements `ImageDisplaying` protocol.
public typealias ImageDisplayingView = UIView & ImageDisplaying

extension UIImageView: ImageDisplaying {
    /// Displays an image.
    open func display(image: Image?) {
        self.image = image
    }
}
#else
import Cocoa
/// An `NSView` that implements `ImageDisplaying` protocol.
public typealias ImageDisplayingView = NSView & ImageDisplaying

extension NSImageView: ImageDisplaying {
    /// Displays an image.
    open func display(image: Image?) {
        self.image = image
    }
}
#endif


// MARK: - ImageLoadingOptions

/// A range of options that control how the image is loaded and displayed.
public struct ImageLoadingOptions {
    /// Shared options.
    public static var shared = ImageLoadingOptions()

    /// Placeholder to be displayed when the image is loading. `nil` by default.
    public var placeholder: Image?

    /// The image transition animation performed when displaying a loaded image.
    /// Only runs when the image was not found in memory cache. `.nil` by default.
    public var transition: Transition?

    /// Image to be displayed when the request fails. `nil` by default.
    public var failureImage: Image?

    /// The image transition animation performed when displaying a failure image.
    /// `.nil` by default.
    public var failureImageTransition: Transition?
    
    /// If true, the requested image will always appear with transition, even
    /// when loaded from cache
    public var alwaysTransition = false

    /// If true, every time you request a new image for a view, the view will be
    /// automatically prepared for reuse: image will be set to `nil`, and animations
    /// will be removed. `true` by default.
    public var isPrepareForReuseEnabled = true

    /// Custom pipeline to be used. `nil` by default.
    public var pipeline: ImagePipeline?

    #if !os(macOS)
    /// Content modes to be used for each image type (placeholder, success,
    /// failure). `nil`  by default (don't change content mode).
    public var contentModes: ContentModes?

    /// Custom content modes to be used for each image type (placeholder, success,
    /// failure).
    public struct ContentModes {
        #if swift(>=4.2)
        /// Content mode to be used for the loaded image.
        public var success: UIView.ContentMode
        /// Content mode to be used when displaying a `failureImage`.
        public var failure: UIView.ContentMode
        /// Content mode to be used when displaying a `placeholder`.
        public var placeholder: UIView.ContentMode

        /// - parameter success: A content mode to be used with a loaded image.
        /// - parameter failure: A content mode to be used with a `failureImage`.
        /// - parameter placeholder: A content mode to be used with a `placeholder`.
        public init(success: UIView.ContentMode, failure: UIView.ContentMode, placeholder: UIView.ContentMode) {
            self.success = success; self.failure = failure; self.placeholder = placeholder
        }
        #else
        /// Content mode to be used for the loaded image.
        public var success: UIViewContentMode
        /// Content mode to be used when displaying a `failureImage`.
        public var failure: UIViewContentMode
        /// Content mode to be used when displaying a `placeholder`.
        public var placeholder: UIViewContentMode

        /// - parameter success: A content mode to be used with a loaded image.
        /// - parameter failure: A content mode to be used with a `failureImage`.
        /// - parameter placeholder: A content mode to be used with a `placeholder`.
        public init(success: UIViewContentMode, failure: UIViewContentMode, placeholder: UIViewContentMode) {
            self.success = success; self.failure = failure; self.placeholder = placeholder
        }
        #endif
    }

    /// - parameter placeholder: Placeholder to be displayed when the image is
    /// loading . `nil` by default.
    /// - parameter transision: The image transition animation performed when
    /// displaying a loaded image. Only runs when the image was not found in
    /// memory cache `.nil` by default (no animations).
    /// - parameter failureImage: Image to be displayd when request fails.
    /// `nil` by default.
    /// - parameter failureImageTransition: The image transition animation
    /// performed when displaying a failure image. `.nil` by default.
    /// - parameter contentModes: Content modes to be used for each image type
    /// (placeholder, success, failure). `nil` by default (don't change content mode).
    public init(placeholder: Image? = nil, transition: Transition? = nil, failureImage: Image? = nil, failureImageTransition: Transition? = nil, contentModes: ContentModes? = nil) {
        self.placeholder = placeholder
        self.transition = transition
        self.failureImage = failureImage
        self.failureImageTransition = failureImageTransition
        self.contentModes = contentModes
    }
    #else
    public init(placeholder: Image? = nil, transition: Transition? = nil, failureImage: Image? = nil, failureImageTransition: Transition? = nil) {
        self.placeholder = placeholder
        self.transition = transition
        self.failureImage = failureImage
        self.failureImageTransition = failureImageTransition
    }
    #endif

    /// An animated image transition.
    public struct Transition {
        var style: Style

        struct Parameters { // internal representation
            let duration: TimeInterval
            #if !os(macOS)
            #if swift(>=4.2)
            let options: UIView.AnimationOptions
            #else
            let options: UIViewAnimationOptions
            #endif
            #endif
        }

        enum Style { // internal representation
            case fadeIn(parameters: Parameters)
            case custom((ImageDisplayingView, Image) -> Void)
        }

        #if !os(macOS)
        /// Fade-in transition (cross-fade in case the image view is already
        /// displaying an image).
        #if swift(>=4.2)
        public static func fadeIn(duration: TimeInterval, options: UIView.AnimationOptions = .allowUserInteraction) -> Transition {
            return Transition(style: .fadeIn(parameters:  Parameters(duration: duration, options: options)))
        }
        #else
        public static func fadeIn(duration: TimeInterval, options: UIViewAnimationOptions = .allowUserInteraction) -> Transition {
            return Transition(style: .fadeIn(parameters:  Parameters(duration: duration, options: options)))
        }
        #endif
        #else
        /// Fade-in transition.
        public static func fadeIn(duration: TimeInterval) -> Transition {
            return Transition(style: .fadeIn(parameters:  Parameters(duration: duration)))
        }
        #endif

        /// Custom transition. Only runs when the image was not found in memory cache.
        public static func custom(_ closure: @escaping (ImageDisplayingView, Image) -> Void) -> Transition {
            return Transition(style: .custom(closure))
        }
    }

    public init() {}
}

// MARK: - ImageViewController

/// Manages image requests on behalf of an image view.
///
/// - note: With a few modifications this might become public at some point,
/// however as it stands today `ImageViewController` is just a helper class,
/// making it public wouldn't expose any additional functionality to the users.
final class ImageViewController {
    // Ideally should be `unowned` but can't because of the Swift bug
    // https://bugs.swift.org/browse/SR-7369
    private weak var imageView: ImageDisplayingView?
    private weak var task: ImageTask?
    private var taskId: Int = 0

    // Automatically cancel the request when the view is deallocated.
    deinit {
        cancelOutstandingTask()
    }

    init(view: /* weak */ ImageDisplayingView) {
        self.imageView = view
    }

    // MARK: - Associating Controller

    static var controllerAK = "ImageViewController.AssociatedKey"

    // Lazily create a controller for a given view and associate it with a view.
    static func controller(for view: ImageDisplayingView) -> ImageViewController {
        if let controller = objc_getAssociatedObject(view, &ImageViewController.controllerAK) as? ImageViewController {
            return controller
        }
        let controller = ImageViewController(view: view)
        objc_setAssociatedObject(view, &ImageViewController.controllerAK, controller, .OBJC_ASSOCIATION_RETAIN)
        return controller
    }

    // MARK: - Loading Images

    func loadImage(with request: ImageRequest,
                   options: ImageLoadingOptions,
                   progress: ImageTask.ProgressHandler? = nil,
                   completion: ImageTask.Completion? = nil) -> ImageTask? {
        cancelOutstandingTask()

        guard let imageView = imageView else {
            return nil
        }

        if options.isPrepareForReuseEnabled { // enabled by default
            #if !os(macOS)
            imageView.layer.removeAllAnimations()
            #else
            imageView.layer?.removeAllAnimations()
            #endif
        }

        let pipeline = options.pipeline ?? ImagePipeline.shared

        // Quick synchronous memory cache lookup
        if request.memoryCacheOptions.isReadAllowed,
            let imageCache = pipeline.configuration.imageCache,
            let response = imageCache.cachedResponse(for: request) {
            handle(response: response, error: nil, fromMemCache: true, options: options)
            completion?(response, nil)
            return nil
        }

        // Display a placeholder.
        if let placeholder = options.placeholder {
            imageView.display(image: placeholder)
            #if !os(macOS)
            if let contentMode = options.contentModes?.placeholder {
                imageView.contentMode = contentMode
            }
            #endif
        } else {
            if options.isPrepareForReuseEnabled {
                imageView.display(image: nil) // Remove previously displayed images (if any)
            }
        }

        // Makes sure that view reuse is handled correctly.
        let taskId = self.taskId

        // Start the request.
        self.task = pipeline.loadImage(
            with: request,
            progress: { [weak self] response, completed, total in
                guard self?.taskId == taskId else { return }
                self?.handle(partialImage: response, options: options)
                progress?(response, completed, total)
            },
            completion: { [weak self] response, error in
                guard self?.taskId == taskId else { return }
                self?.handle(response: response, error: error, fromMemCache: false, options: options)
                completion?(response, error)
            }
        )
        return self.task
    }

    func cancelOutstandingTask() {
        taskId += 1
        task?.cancel()
        task = nil
    }

    // MARK: - Handling Responses

    #if !os(macOS)

    private func handle(response: ImageResponse?, error: Error?, fromMemCache: Bool, options: ImageLoadingOptions) {
        if let image = response?.image {
            _display(image, options.transition, options.alwaysTransition, fromMemCache, options.contentModes?.success)
        } else if let failureImage = options.failureImage {
            _display(failureImage, options.failureImageTransition, options.alwaysTransition, fromMemCache, options.contentModes?.failure)
        }
        self.task = nil
    }

    private func handle(partialImage response: ImageResponse?, options: ImageLoadingOptions) {
        guard let image = response?.image else { return }
        _display(image, options.transition, options.alwaysTransition, false, options.contentModes?.success)
    }

    #else

    private func handle(response: ImageResponse?, error: Error?, fromMemCache: Bool, options: ImageLoadingOptions) {
        // NSImageView doesn't support content mode, unfortunately.
        if let image = response?.image {
            _display(image, options.transition, options.alwaysTransition, fromMemCache, nil)
        } else if let failureImage = options.failureImage {
            _display(failureImage, options.failureImageTransition, options.alwaysTransition, fromMemCache, nil)
        }
        self.task = nil
    }

    private func handle(partialImage response: ImageResponse?, options: ImageLoadingOptions) {
        guard let image = response?.image else { return }
        _display(image, options.transition, options.alwaysTransition, false, nil)
    }

    #endif

    private func _display(_ image: Image, _ transition: ImageLoadingOptions.Transition?, _ alwaysTransition: Bool, _ fromMemCache: Bool, _ newContentMode: _ContentMode?) {
        guard let imageView = imageView else { return }

        if !fromMemCache || alwaysTransition, let transition = transition {
            switch transition.style {
            case let .fadeIn(params):
                _runFadeInTransition(image: image, params: params, contentMode: newContentMode)
            case let .custom(closure):
                // The user is reponsible for both displaying an image and performing
                // animations.
                closure(imageView, image)
            }
        } else {
            imageView.display(image: image)
        }
        #if !os(macOS)
        if let newContentMode = newContentMode {
            imageView.contentMode = newContentMode
        }
        #endif
    }

    // MARK: - Animations

    #if !os(macOS)

    // Image view used for cross-fade transition between images with different
    // content modes.
    private lazy var transitionImageView = UIImageView()

    #if swift(>=4.2)
    private typealias _ContentMode = UIView.ContentMode
    #else
    private typealias _ContentMode = UIViewContentMode
    #endif

    private func _runFadeInTransition(image: Image, params: ImageLoadingOptions.Transition.Parameters, contentMode: _ContentMode?) {
        guard let imageView = imageView else { return }

        // Special case where we animate between content modes, only works
        // on imageView subclasses.
        if let contentMode = contentMode, imageView.contentMode != contentMode, let imageView = imageView as? UIImageView, imageView.image != nil {
            _runCrossDissolveWithContentMode(imageView: imageView, image: image, params: params)
        } else {
            _runSimpleFadeIn(image: image, params: params)
        }
    }

    private func _runSimpleFadeIn(image: Image, params: ImageLoadingOptions.Transition.Parameters) {
        guard let imageView = imageView else { return }

        UIView.transition(
            with: imageView,
            duration: params.duration,
            options: params.options.union(.transitionCrossDissolve),
            animations: {
                imageView.display(image: image)
            },
            completion: nil
        )
    }

    /// Performs cross-dissolve animation alonside transition to a new content
    /// mode. This isn't natively supported feature and it requires a second
    /// image view. There might be better ways to implement it.
    private func _runCrossDissolveWithContentMode(imageView: UIImageView, image: Image, params: ImageLoadingOptions.Transition.Parameters) {
        // Lazily create a transition view.
        let transitionView = self.transitionImageView

        // Create a transition view which mimics current view's contents.
        transitionView.image = imageView.image
        transitionView.contentMode = imageView.contentMode
        imageView.addSubview(transitionView)
        transitionView.frame = imageView.bounds

        // "Manual" cross-fade.
        transitionView.alpha = 1
        imageView.alpha = 0
        imageView.image = image // Display new image in current view

        UIView.animate(
            withDuration: params.duration,
            delay: 0,
            options: params.options,
            animations: {
                transitionView.alpha = 0
                imageView.alpha = 1
            },
            completion: { isCompleted in
                if isCompleted {
                    transitionView.removeFromSuperview()
                }
            }
        )
    }

    #else

    private typealias _ContentMode = Void // There is no content mode on macOS

    private func _runFadeInTransition(image: Image, params: ImageLoadingOptions.Transition.Parameters, contentMode: _ContentMode?) {
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.duration = params.duration
        animation.fromValue = 0
        animation.toValue = 1
        imageView?.layer?.add(animation, forKey: "imageTransition")
    }

    #endif
}

#endif
