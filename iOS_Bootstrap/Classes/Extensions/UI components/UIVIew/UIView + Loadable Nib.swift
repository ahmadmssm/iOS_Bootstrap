//
//  UIView + Loadable Nib.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 2/15/19.
//

public extension UIView {
    public func loadFromNibIfEmbeddedInDifferentNib() -> Self {
        let isJustAPlaceholder = subviews.count == 0
        if isJustAPlaceholder {
            let theRealThing = type(of: self).viewFromNib()
            theRealThing.frame = frame
            translatesAutoresizingMaskIntoConstraints = false
            theRealThing.translatesAutoresizingMaskIntoConstraints = false
            return theRealThing
        }
        return self
    }
}

public extension UIView {
    public class func viewFromNib(withOwner owner: Any? = nil) -> Self {
        let name = String(describing: type(of:      self)).components(separatedBy: ".")[0]
        let view = UINib(nibName: name, bundle: nil).instantiate(withOwner: owner, options: nil)[0]
        return cast(view)!
    }
    
    private class func cast<T, U>(_ value: T) -> U? {
        return value as? U
    }
}

public extension UIView {
    public static func loadNib<T: UIView>(_ viewType: T.Type) -> T {
        let className = String.className(viewType)
        return Bundle(for: viewType).loadNibNamed(className, owner: nil, options: nil)!.first as! T
    }
    
    public static func loadNib() -> Self {
        return loadNib(self)
    }
}

extension UIView: NibLoadableView {}


