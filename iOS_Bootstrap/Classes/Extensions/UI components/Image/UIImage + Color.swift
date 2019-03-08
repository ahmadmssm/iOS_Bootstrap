//
//  UIImage + Color.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 3/8/19.
//

public extension UIImage {
    public func withBackgroundColor(_ color: UIColor) -> UIImage? {
        var image: UIImage?
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        let imageRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        if let context = UIGraphicsGetCurrentContext() {
            context.setFillColor(color.cgColor)
            context.fill(imageRect)
            draw(in: imageRect, blendMode: .normal, alpha: 1.0)
            image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return image
        }
        return nil
    }
    
    public func withColor(_ color: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        color.setFill()
        let context = UIGraphicsGetCurrentContext()
        context?.translateBy(x: 0, y: self.size.height)
        context?.scaleBy(x: 1.0, y: -1.0)
        context?.setBlendMode(CGBlendMode.normal)
        let rect = CGRect(origin: .zero, size: CGSize(width: self.size.width, height: self.size.height))
        context?.clip(to: rect, mask: self.cgImage!)
        context?.fill(rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}
