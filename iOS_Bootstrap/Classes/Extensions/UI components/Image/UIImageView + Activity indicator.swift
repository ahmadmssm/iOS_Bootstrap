//
//  File.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 12/21/18.
//

public extension UIImageView {
    private var activityIndicator: UIActivityIndicatorView {
        get {
            let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .white)
            activityIndicator.hidesWhenStopped = true
            activityIndicator.center = CGPoint(x:self.frame.width/2,
                                               y: self.frame.height/2)
            activityIndicator.stopAnimating()
            self.addSubview(activityIndicator)
            return activityIndicator
        }
    }
    
    public func showActivityIndicator() { activityIndicator.startAnimating() }
    
    public func dismissActivityIndicator() {
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
    }
}
